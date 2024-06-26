//
//  DatabaseManager.swift
//  UConnect
//
//  Created by student on 23/04/24.
//

//
//  DatabaseManger.swift
//  messagetab
//
//  Created by Sharanpreet Singh  on 05/05/24.
//

import Foundation
import FirebaseDatabase
final class DatabaseManager{
    
     static let shared  = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
    //MARK: -Public

    ///Check if username and email is available
    /// -Parameters
    ///      -email: String representing email
    ///      -username: String representing username
    ///      -completion: async callback for result if database entry succeeded

    public func canCreateNewUser(with email:String, username: String, completion: @escaping (Bool)->Void){
        completion(true)
        
    }

    ///Inserts new user data to database
    /// -Parameters
    ///      -email: String representing email
    ///      -username: String representing username

    public func insertNewUser(with email:String, username: String, completion: @escaping (Bool)-> Void ){
        
        database.child(email.safeDatabaseKey()).setValue(["username":username]) { error, _ in
            if error == nil {
                //succeeded
                completion(true)
                return
            }
            else{
                //failed
                completion(false)
                return
            }
        }
        
    }

    
    static func safeEmail(emailAddress: String)-> String{
        var safeEmail = emailAddress .replacingOccurrences(of:  ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
        
    }
    
}
// MARK: - Account Management
extension DatabaseManager{
    public  func userExists(with email : String , completion : @escaping((Bool )-> Void) ){
        var safeEmail = email.replacingOccurrences(of:  ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(safeEmail).observeSingleEvent(of: .value, with:{ snapshot in
            guard  snapshot.value as? String != nil else{
                completion(false )
                return
            }
            
            completion (true)
        })
        
    }
    
    /// Inserts new user to database
    public func insertUser(with user : ChatAppUser, completion : @escaping(Bool)->Void){
        database.child(user.safeEmail  ).setValue([
            "first_name" : user.firstName,
            "last_name" : user.lastName
            
        ], withCompletionBlock: {error, _ in
            guard error == nil else{
                print("failed ot write to database")
                completion(false )
                return
            }
            
            self.database.child("users").observeSingleEvent(of: .value, with: {snapshot in
                if var usersCollection = snapshot.value as? [[String:String]]{
                    // append to user dictionary
                    let newElement =  [
                        "name": user.firstName + " " + user.lastName,"email": user.safeEmail
                    ]
                    usersCollection.append(newElement)
                    
                    self.database.child("users").setValue(usersCollection , withCompletionBlock: {
                        error , _ in
                        guard error == nil else {
                            completion(false)
                            return
                        }
                        completion(true  )
                    })
                }
                else {
                    // create that dictionaly
                    let newCollection: [[String: String]] = [
                        ["name": user.firstName + " " + user.lastName,"email": user.safeEmail]
                    ]
                    self.database.child("users").setValue(newCollection , withCompletionBlock: {
                        error , _ in
                        guard error == nil else {
                            completion(false)
                            return
                        }
                        completion(true  )
                    })
                }
            })
            
            
            //            completion(true )
            
        })
    }
    
    public func getAllUsers(completion : @escaping (Result<[ [ String: String]],Error>) -> Void ){
        database.child("users").observeSingleEvent(of: .value , with: {snapshot in
            guard let  value = snapshot.value as? [[String:String]] else {
                completion(.failure(DatabaseError.failedToFetch))
                return
            }
            completion(.success(value))
        })
    }
    public enum DatabaseError : Error {
        case failedToFetch
    }
    
    /*
    "dfsdfdsfds" {
        "messages":[
        {
            "id": String,
            "type": text, photo, video,
            "content": String,
            "date": Date(),
            "sender _email": String,
            "isRead": true/false,
        }
        ]
    }
    

    conversaiton =>
    [
        [
            "conversation_id":
                "other_user_email":
                "latest_message": =>{
                    "date": Date()
                    "latest_message": "message"
                    "is_read": true/false
                }
        ],
    */
     
}

//  MARKS :- SENDING MESSAGE / CONVERSATION

extension DatabaseManager{
    /// create  a new conversation with target user email and first message sent
    public func createNewConversation (with otherUserEmail : String,  name : String , firstMessage : Message , completion : @escaping (Bool) -> Void ){
        guard let currentEmail = UserDefaults.standard.value(forKey: "email") as? String else {
            return
        }
        let safeEmail = DatabaseManager.safeEmail(emailAddress: currentEmail)
        
        let ref = database.child("\(safeEmail)")
        
        ref.observeSingleEvent(of: .value,
                               with: {snapshot in
            guard var  userNode = snapshot .value as? [String: Any] else {
                completion (false)
                print("user not found")
                return
            }
            
            let messageDate = firstMessage.sentDate
            let dateString = ChatViewController .dateFormatter.string(from: messageDate)
            
            var message = ""
            
            switch firstMessage .kind {
            case .text(let messageText):
                message = messageText
                
            case .attributedText(_) : break
                
            case .photo(_):break
                
            case.video(_):break
                
            case.location(_):break
                
            case .emoji(_):break
                
            case.audio(_):break
                
            case.contact(_):break
                
            case .custom(_):break
            case .linkPreview(_): break
                // Placeholder for handling link preview
            }
            
            let conversationId = "conversation _\( firstMessage.messageId)"
            let newConversationData : [String: Any] = [
                "id": conversationId,
                "other_user_email": otherUserEmail,
                "name" : name ,
                "latest_message":[
                    "date": dateString,
                    "message":message,
                    "is_read": false
                ]
            ]
            if var conversations = userNode["conversations"] as? [[String: Any]] {
                // conversation array exists for current user
                // you should append
                
                conversations.append (newConversationData)
                userNode[ "conversations"] = conversations
                
                
                ref.setValue(userNode, withCompletionBlock: { [weak self ]error, _ in
                    guard error == nil else {
                        completion(false)
                        return
                    }
                    self?.finishCreatingConversation(name : name ,conversationID: conversationId, firstMessage: firstMessage, completion: completion)
                  
                })
            }
            else {
                // conversation array does NOT exist
                // create it
                userNode[ "conversations"] = [
                    newConversationData
                ]
                ref.setValue(userNode, withCompletionBlock: { [weak self ]error, _ in
                    guard error == nil else {
                        completion(false)
                        return
                    }
                    self?.finishCreatingConversation(name : name ,conversationID: conversationId, firstMessage: firstMessage, completion: completion)
                  
                })
            }
        })
        
    }
    private func finishCreatingConversation ( name : String ,conversationID: String, firstMessage: Message,completion: @escaping (Bool) -> Void)
    {
        //{
        //        "id": String,
        //        "type": text, photo, video,
        //        "content": String,
        //        "date": Date(),
        //        "sender_email": String,
        //        "isRead": true/false,
        //}
        
        //
        let messageDate = firstMessage.sentDate
        let dateString = ChatViewController .dateFormatter.string(from: messageDate)
        
        var message = ""
        switch firstMessage .kind {
        case .text(let messageText):
            message = messageText
            
        case .attributedText(_) : break
            
        case .photo(_):break
            
        case.video(_):break
            
        case.location(_):break
            
        case .emoji(_):break
            
        case.audio(_):break
            
        case.contact(_):break
            
        case .custom(_):break
            
        case .linkPreview(_):
            break
        }
            guard  var myEmmail = UserDefaults.standard.value (forKey: "email")as? String else {
                completion (false)
                return
        
            }
            let currentUserEmail = DatabaseManager.safeEmail(emailAddress: myEmmail)
        
            let collectionMessage: [String: Any] = [
                "id":firstMessage.messageId,
                "type":firstMessage.kind.messageKindString ,
                "content": message,
                "date":dateString,
                "sender_email":currentUserEmail,
                "is_read":false,
                "name": name
            ]
            let value: [String: Any] = [
                "messages" : [
                    collectionMessage
                ]
            ]
            print("adding convo: \(conversationID)")
        database.child("\(conversationID)").setValue( value , withCompletionBlock : {error , _ in
            
            guard error == nil else {
                completion (false)
                return
            }
            completion (true)
        })
    }
    /// Fetches and returns all conversation for the user with passed in email
    public func getAllConversations(for email: String , completion : @escaping (Result <String, Error>) -> Void ){
        
    }
    /// gets all messages for a given conversation
    public func getAllMessagesForConversation (with id : String, completion : @escaping (Result <String,Error >)-> Void ){
        
    }
    /// sends a message with target conversation and message
    public func SendMessage(to conversation : String , mmessage : Message ,completion : @escaping(Bool)-> Void ){
        
    }
}







struct ChatAppUser {
    let firstName :String
    let lastName : String
    let emailAddress : String
    
    var safeEmail : String {
        var safeEmail = emailAddress .replacingOccurrences(of:  ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    var profilePictureFileName : String {
        //afraz9-gmail-com_profile_picture.png
        return "\(safeEmail)_Profile_picture.png  "
    }
}

