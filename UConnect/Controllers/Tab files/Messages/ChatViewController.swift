//
//  ChatViewController.swift
//  UConnect
//
//  Created by student on 09/05/24.
//
import UIKit
import MessageKit
import InputBarAccessoryView

struct Message : MessageType{
    public var sender: SenderType
    
    public var messageId: String
   
    public var sentDate: Date
   
    public var kind: MessageKind
    
}
extension MessageKind {
    var messageKindString: String {
        switch self {
            
        case .text(_):
            return "text"
        case .attributedText(_):
            return "attributed_text"
        case .photo(_):
            return "photo"
        case .video(_):
            return "video"
        case .location(_):
            return "location"
        case .emoji(_):
            return "emoji"
        case .audio(_):
            return "audio"
        case .contact(_):
            return "contact"
        
        case .custom(_):
            return "cs"
        case .linkPreview(_):
            return ""
            break
            // TODO: Handle link preview
            // Add your code here to handle the link preview
        }
    }
}

struct Sender :SenderType{
    public var photoURL :String
    public var senderId: String
    public var displayName: String
}
class ChatViewController: MessagesViewController {
    
    
    
    
    public static let dateFormatter: DateFormatter = {
        let formattre = DateFormatter ()
        formattre.dateStyle = .medium
        formattre.timeStyle = .long
        formattre.locale = .current
        return formattre
    }()
    public let  otherUserEmail: String
    public var isNewConversation = false
  
    
    private var messages = [Message]()
    private var selfSender : Sender?  {
        
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else{
         return nil
        }
        return Sender (
            photoURL: "",
            senderId: email ,
            displayName : "Joe Smith")
    }
    
    
    init (with email :String){
        self.otherUserEmail = email
        super .init(nibName : nil, bundle :nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        messageInputBar.inputTextView.becomeFirstResponder()
    }
    
}
extension ChatViewController : InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        guard !text.replacingOccurrences(of: " ", with: "").isEmpty ,
        let selfSender = self.selfSender, let messageId = createMessageId() else {
            return
        }
        print ("Sending :\(text)")
        //send message
        if isNewConversation{
            let mmessage = Message(sender: selfSender ,
                                  messageId: messageId,
                                  sentDate: Date(),
                                  kind: .text(text))
            DatabaseManager.shared.createNewConversation(with: otherUserEmail, name :self.title ?? "User",
                                                         firstMessage: mmessage,
                                                         completion: {  success in
                if success {
                    print ("message sent")
                }else {
                    print ("faield ot send")
                }
            })
            //create convo in database
        }
        else{
            //append to existing conversation data
            
        }
    }
                private func createMessageId() -> String? {
                    //date , otheruseremail , senderemail , random int
                    
                    guard let currentUserEmail = UserDefaults.standard.value(forKey: "email ") as? String else {
                        return nil
                    }
                   
                    let safeCurrentEmail = DatabaseManager.safeEmail (emailAddress: currentUserEmail  )
                    let dateString = Self .dateFormatter.string(from: Date())
                    let newIdentifier = "\(otherUserEmail)_\(currentUserEmail) _\(dateString)"
                    print("created message id: \(newIdentifier)")
                    return newIdentifier
                }
}
                                                         
                                                         
extension  ChatViewController : MessagesDataSource, MessagesLayoutDelegate,MessagesDisplayDelegate{
    var currentSender: any MessageKit.SenderType {
        if let sender = selfSender{
            return sender
        }
        fatalError("Self Sender is nil, email should be cached" )
        return Sender(photoURL: "", senderId: "12", displayName: "")
    }
    
    
//
//    func currentSender()-> SenderType{
//
//    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
