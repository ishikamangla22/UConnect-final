//
//  Notifications.swift
//  UConnect
//
//  Created by student on 04/05/24.
//

import Foundation

struct Notification {
    var communityProfileImageName: String
    var communityName: String
    var descriptionMessage: String
}

// Sample data
let notifications: [String: [Notification]] = [
    
    "New": [
        Notification(communityProfileImageName: "pop_icon",
                     communityName: "Pop Dancers",
                     descriptionMessage: "New Post By Shradha")
    ],
    
    "Yesterday": [
        Notification(communityProfileImageName: "geeky_ants",
                     communityName: "Geeky Ants",
                     descriptionMessage: "New Post By Rahul"),
        Notification(communityProfileImageName: "pop_icon",
                     communityName: "Pop Dancers",
                     descriptionMessage: "New Message From Radha"),
        Notification(communityProfileImageName: "hip_icon",
                     communityName: "Hip Hoppers",
                     descriptionMessage: "New Post By Ankit"),
        Notification(communityProfileImageName: "kickin_crew",
                     communityName: "Kickin' Crew",
                     descriptionMessage: "New Post By Ankita")
    ],
    
    
    "Last 7 Days": [
        Notification(communityProfileImageName: "noise_set",
                     communityName: "Noise Set",
                     descriptionMessage: "New Post By Raman"),
        Notification(communityProfileImageName: "hip_icon",
                     communityName: "Hip Hoppers",
                     descriptionMessage: "New Post By Hemant"),
        Notification(communityProfileImageName: "geeky_ants",
                     communityName: "Geeky Ants",
                     descriptionMessage: "New Message From Rahul"),
        Notification(communityProfileImageName: "kickin_crew",
                     communityName: "Kickin' Crew",
                     descriptionMessage: "New Message From Rohini")
    ]
    
    
]

var sections = [ "New", "Yesterday", "Last 7 Days" ]

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

