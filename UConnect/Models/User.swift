//
//  User.swift
//  UConnect
//
//  Created by student on 25/04/24.
//

import Foundation

struct User{
    var userId: Int
    var useremail: String
    var userPassword: String
    var userName : String
    var userImage: String?
    var isEmailVerified: Bool
    var collegeName: String
    var gender: String
    var branch: String
    var userYearOfStudy: Int
    var userBio: String?
    var numberOfCommunities: Int
    var interest : [String]
    
    
}

//class UserDataModel {
//    private var users: [User] = []
//    
//    init() {
//        for i in 1..6 {
//            let userId = "\(i)"
//            let userName = "User_\(i)"
//            let userImage = "User\(i)"
//            let userEmailVerified = true
//            
//        }
//    }
//}
