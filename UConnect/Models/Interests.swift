//
//  Interests.swift
//  UConnect
//
//  Created by student on 02/05/24.
//
//
//import Foundation
//import UIKit
//
//
//var Interests: [String] = [
//    "Technology",
//    "Drawing",
//    "Climbing",
//    "Dance",
//    "Music",
//    "Journaling",
//    "Photography",
//    "Reading",
//    "Cooking",
//    "Yoga",
//    "Outdoor Games",
//    "Chess",
//    "Carrom",
//    "Singing",
//    "Sleeping",
//    "Eating",
//    "Vlogging",
//    "Writing",
//    "Gym",
//    "Guitar",
//    "Designing",
//    "Stitching",
//    "MakeUp Artist",
//    "Studying",
//    "Coding"
//]
//
//var interestsImage: [UIImage] = [
//    UIImage(named: "technology")!,
//    UIImage(named: "drawing")!,
//    UIImage(named: "climbing")!,
//    UIImage(named: "dancing")!,
//    UIImage(named: "music")!,
//    UIImage(named: "journaling")!,
//    UIImage(named: "photography")!,
//    UIImage(named: "reading")!,
//    UIImage(named: "cooking")!,
//    UIImage(named: "yoga")!,
//    UIImage(named: "outdoor games")!,
//    UIImage(named: "chess")!,
//    UIImage(named: "carrom")!,
//    UIImage(named: "singing")!,
//    UIImage(named: "sleeping")!,
//    UIImage(named: "eating")!,
//    UIImage(named: "vlogging")!,
//    UIImage(named: "writing")!,
//    UIImage(named: "gyming")!,
//    UIImage(named: "guitarist")!,
//    UIImage(named: "designing")!,
//    UIImage(named: "stitching")!,
//    UIImage(named: "makeup artist")!,
//    UIImage(named: "studying")!,
//    UIImage(named: "coding")!
//]

import UIKit

// Struct representing an individual interest
struct InterestItem {
    let name: String
    let image: UIImage
}

// Singleton class representing the Interests data model
class InterestDataManager {
    static let shared = InterestDataManager() // Singleton instance
    
    static func getInstance()->InterestDataManager {
        return shared
    }
    
    // Static property holding interest names
    private static let interests: [String] = [
        "Technology",
        "Drawing",
        "Climbing",
        "Dance",
        "Music",
        "Journaling",
        "Photography",
        "Reading",
        "Cooking",
        "Yoga",
        "Outdoor Games",
        "Chess",
        "Carrom",
        "Singing",
        "Sleeping",
        "Eating",
        "Vlogging",
        "Writing",
        "Gym",
        "Guitar",
        "Designing",
        "Stitching",
        "MakeUp Artist",
        "Studying",
        "Coding"
    ]
    
    // Static property holding interest images
    private static let interestsImage: [UIImage] = [
        UIImage(named: "technology")!,
        UIImage(named: "drawing")!,
        UIImage(named: "climbing")!,
        UIImage(named: "dancing")!,
        UIImage(named: "music")!,
        UIImage(named: "journaling")!,
        UIImage(named: "photography")!,
        UIImage(named: "reading")!,
        UIImage(named: "cooking")!,
        UIImage(named: "yoga")!,
        UIImage(named: "outdoor games")!,
        UIImage(named: "chess")!,
        UIImage(named: "carrom")!,
        UIImage(named: "singing")!,
        UIImage(named: "sleeping")!,
        UIImage(named: "eating")!,
        UIImage(named: "vlogging")!,
        UIImage(named: "writing")!,
        UIImage(named: "gyming")!,
        UIImage(named: "guitarist")!,
        UIImage(named: "designing")!,
        UIImage(named: "stitching")!,
        UIImage(named: "makeup artist")!,
        UIImage(named: "studying")!,
        UIImage(named: "coding")!
    ]
    
    private var interestsData: [InterestItem] = []
    
    private init() {
        // Populate initial data
        initializeInterests()
    }
    
    private func initializeInterests() {
        for index in 0..<InterestDataManager.interests.count {
            let interestItem = InterestItem(name: InterestDataManager.interests[index], image: InterestDataManager.interestsImage[index])
            interestsData.append(interestItem)
        }
    }
    
    // Function to fetch all interests
    func fetchAllInterests() -> [InterestItem] {
        return interestsData
    }
    
    // Add more functions as needed, e.g., to filter interests, etc.
}

var dataModelOfInterests: InterestDataManager = InterestDataManager.shared

