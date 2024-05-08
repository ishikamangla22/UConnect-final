//
//  File.swift
//  UConnect
//
//  Created by student on 05/05/24.
//
import Foundation

// Struct representing an individual post
struct popDancersPost {
    var post: String
}

// Singleton class representing the Post data model
class popDancersPostDataManager {
    static let shared = popDancersPostDataManager() // Singleton instance
    
    // Static property holding posts
    private var popDancersPosts: [popDancersPost] = [
        popDancersPost(post: "pop1"),
        popDancersPost(post: "pop2"),
        popDancersPost(post: "pop3"),
        popDancersPost(post: "pop4"),
        popDancersPost(post: "pop5"),
        popDancersPost(post: "pop6"),
        popDancersPost(post: "pop7"),
        popDancersPost(post: "pop8"),
        popDancersPost(post: "pop9"),
        popDancersPost(post: "pop10"),
        popDancersPost(post: "pop11"),
        popDancersPost(post: "pop12")
    ]
    
    private init() {
        // Initialize is private to prevent outside initialization
    }
    
    // Function to fetch all posts
    func fetchAllPosts() -> [popDancersPost] {
        return popDancersPosts
    }
    
    // Add more functions as needed, e.g., to filter posts, add new posts, etc.
}

// Accessing the singleton instance and using it
let postDataManager = popDancersPostDataManager.shared
let popDancersPosts = postDataManager.fetchAllPosts()
