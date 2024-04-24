//
//  DatabaseManager.swift
//  UConnect
//
//  Created by student on 23/04/24.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
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
    
}
