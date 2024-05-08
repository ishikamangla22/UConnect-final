//
//  Notifications.swift
//  UConnect
//
//  Created by student on 04/05/24.
//

//import Foundation
//
//struct Notification {
//    var communityProfileImageName: String
//    var communityName: String
//    var descriptionMessage: String
//}
//
//// Sample data
//let notifications: [String: [Notification]] = [
//    
//    "New": [
//        Notification(communityProfileImageName: "pop_icon",
//                     communityName: "Pop Dancers",
//                     descriptionMessage: "New Post By Shradha")
//    ],
//    
//    "Yesterday": [
//        Notification(communityProfileImageName: "geeky_ants",
//                     communityName: "Geeky Ants",
//                     descriptionMessage: "New Post By Rahul"),
//        Notification(communityProfileImageName: "pop_icon",
//                     communityName: "Pop Dancers",
//                     descriptionMessage: "New Message From Radha"),
//        Notification(communityProfileImageName: "hip_icon",
//                     communityName: "Hip Hoppers",
//                     descriptionMessage: "New Post By Ankit"),
//        Notification(communityProfileImageName: "kickin_crew",
//                     communityName: "Kickin' Crew",
//                     descriptionMessage: "New Post By Ankita")
//    ],
//    
//    
//    "Last 7 Days": [
//        Notification(communityProfileImageName: "noise_set",
//                     communityName: "Noise Set",
//                     descriptionMessage: "New Post By Raman"),
//        Notification(communityProfileImageName: "hip_icon",
//                     communityName: "Hip Hoppers",
//                     descriptionMessage: "New Post By Hemant"),
//        Notification(communityProfileImageName: "geeky_ants",
//                     communityName: "Geeky Ants",
//                     descriptionMessage: "New Message From Rahul"),
//        Notification(communityProfileImageName: "kickin_crew",
//                     communityName: "Kickin' Crew",
//                     descriptionMessage: "New Message From Rohini")
//    ]
//    
//    
//]
//
//var sections = [ "New", "Yesterday", "Last 7 Days" ]

//// Accessing the notifications
//if let newNotifications = notifications["New"] {
//    print("New Notifications:")
//    for notification in newNotifications {
//        print(notification)
//    }
//}
//
//if let yesterdayNotifications = notifications["Yesterday"] {
//    print("\nYesterday's Notifications:")
//    for notification in yesterdayNotifications {
//        print(notification)
//    }
//}
//
//if let last7DaysNotifications = notifications["Last 7 Days"] {
//    print("\nLast 7 Days' Notifications:")
//    for notification in last7DaysNotifications {
//        print(notification)
//    }
//}


import Foundation

// Struct representing an individual notification
struct NotificationItem {
    var communityProfileImageName: String
    var communityName: String
    var descriptionMessage: String
}

// Singleton class representing the Notifications data model
class NotificationDataManager {
    static let shared = NotificationDataManager() // Singleton instance
    
    // Static property holding notifications
    private var notifications: [String: [NotificationItem]] = [
        "New": [
            NotificationItem(communityProfileImageName: "pop_icon",
                             communityName: "Pop Dancers",
                             descriptionMessage: "New Post By Shradha")
        ],
        "Yesterday": [
            NotificationItem(communityProfileImageName: "geeky_ants",
                             communityName: "Geeky Ants",
                             descriptionMessage: "New Post By Rahul"),
            NotificationItem(communityProfileImageName: "pop_icon",
                             communityName: "Pop Dancers",
                             descriptionMessage: "New Message From Radha"),
            NotificationItem(communityProfileImageName: "hip_icon",
                             communityName: "Hip Hoppers",
                             descriptionMessage: "New Post By Ankit"),
            NotificationItem(communityProfileImageName: "kickin_crew",
                             communityName: "Kickin' Crew",
                             descriptionMessage: "New Post By Ankita")
        ],
        "Last 7 Days": [
            NotificationItem(communityProfileImageName: "noise_set",
                             communityName: "Noise Set",
                             descriptionMessage: "New Post By Raman"),
            NotificationItem(communityProfileImageName: "hip_icon",
                             communityName: "Hip Hoppers",
                             descriptionMessage: "New Post By Hemant"),
            NotificationItem(communityProfileImageName: "geeky_ants",
                             communityName: "Geeky Ants",
                             descriptionMessage: "New Message From Rahul"),
            NotificationItem(communityProfileImageName: "kickin_crew",
                             communityName: "Kickin' Crew",
                             descriptionMessage: "New Message From Rohini")
        ]
    ]
    
    private init() {
        // Initialize is private to prevent outside initialization
    }
    
    // Function to fetch all notifications
    func fetchAllNotifications() -> [String: [NotificationItem]] {
        return notifications
    }
    
    // Add more functions as needed, e.g., to filter notifications, mark as read, etc.
}

// Accessing the singleton instance and using it
let notificationDataManager = NotificationDataManager.shared
let notifications = notificationDataManager.fetchAllNotifications()
let sectionKeys = Array(notifications.keys)


