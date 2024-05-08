//
//  Community Requests.swift
//  UConnect
//
//  Created by student on 03/05/24.
//

//import Foundation

//struct communityRequest {
//    var communityProfileImageName: String
//    var communityName: String
//    var requestStatus: String
//}
//
//let Request1 = communityRequest(
//    communityProfileImageName: "pop_icon",
//    communityName: "Pop Dancers",
//    requestStatus: "ACCEPTED"
//)
//
//let Request2 = communityRequest(
//    communityProfileImageName: "hip_icon",
//    communityName: "Hip Hoppers",
//    requestStatus: "REJECTED"
//)
//
//let Request3 = communityRequest(
//    communityProfileImageName: "geeky_ants",
//    communityName: "Geeky Ants",
//    requestStatus: "PENDING"
//)
//
//let Request4 = communityRequest(
//    communityProfileImageName: "kickin_crew",
//    communityName: "Kickin' Crew",
//    requestStatus: "PENDING"
//)
//
//var communityRequests: [communityRequest] = [
//    Request1,
//    Request2,
//    Request3,
//    Request4
//]

import UIKit

// Struct representing an individual community request
struct CommunityRequestItem {
    let communityProfileImageName: String
    let communityName: String
    let requestStatus: String
}

// Singleton class representing the CommunityRequests data model
class CommunityRequestDataManager {
    static let shared = CommunityRequestDataManager() // Singleton instance
    
    // Static property holding community requests
    private static let communityRequests: [CommunityRequestItem] = [
        CommunityRequestItem(communityProfileImageName: "pop_icon", communityName: "Pop Dancers", requestStatus: "ACCEPTED"),
        CommunityRequestItem(communityProfileImageName: "hip_icon", communityName: "Hip Hoppers", requestStatus: "REJECTED"),
        CommunityRequestItem(communityProfileImageName: "geeky_ants", communityName: "Geeky Ants", requestStatus: "PENDING"),
        CommunityRequestItem(communityProfileImageName: "kickin_crew", communityName: "Kickin' Crew", requestStatus: "PENDING")
    ]
    
    private init() {
        // Initialize is private to prevent outside initialization
    }
    
    // Function to fetch all community requests
    func fetchAllCommunityRequests() -> [CommunityRequestItem] {
        return CommunityRequestDataManager.communityRequests
    }
    
    // Add more functions as needed, e.g., to filter requests, update request status, etc.
}

// Accessing the singleton instance and using it
let communityRequestDataManager = CommunityRequestDataManager.shared
let communityRequests = communityRequestDataManager.fetchAllCommunityRequests()
