////
////  Post.swift
////  UConnect
////
////  Created by student on 30/04/24.
////
//
//import Foundation
//
//struct Post {
//    var communityProfileImageName: String
//    var communityName: String
//    var sharedBy: String
//    var postImageName: String
//    var postDescription: String
//    var like_count: String
//}
////struct Post: Codable, Identifiable {
////    enum CodingKeys: CodingKey {
////        case communityProfileImageName
////        case communityName
////        case sharedBy
////        case postImageName
////        case postDescription
////        case like_count
////    }
////    var id = UUID()
////    var communityProfileImageName: String
////    var communityName: String
////    var sharedBy: String
////    var postImageName: String
////    var postDescription: String
////    var like_count: String
////}
////
////class ReadJsonData: ObservableObject {
////  @Published var posts = [Post]()
//
////  init() {
////    fetchData(completion: { posts in
////      self.posts = posts
////    })
////  }
//
////  func fetchData(completion: @escaping ([Post]) -> Void) {
////    guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
////      print("JSON file not found")
////      return // Exit the function if URL retrieval fails
////    }
////
////    do {
////      let data = try Data(contentsOf: url)
////      let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
////      completion(decodedPosts) // Call the completion handler with fetched posts
////    } catch {
////      print("Error fetching data:", error)
////    }
////  }
////}
//
//let Post1 = Post(
//    communityProfileImageName: "pop_icon",
//    communityName: "Pop Dancers",
//    sharedBy: "Shared by: Shradha",
//    postImageName: "post1",
//    postDescription: "Hey all,We, as a team of 5, Sudhansu, Akhilesh, Rohit, Sagar, and Vaibhav coordinated a dance workshop today where we taught our peers dance on latest trending song Kinni Kinni. The workshop was a big blast. Hope to see you all in the next workshop as well… ",
//    like_count: "245"
//)
//
//let Post2 = Post(
//    communityProfileImageName: "hip_icon",
//    communityName: "Hip Hoppers",
//    sharedBy: "shared By: Jignesh",
//    postImageName: "post2",
//    postDescription: "Check out this amazing dance event!",
//    like_count: "245"
//)
//
//let Post3 = Post(
//    communityProfileImageName: "pop_icon",
//    communityName: "Pop Dancers",
//    sharedBy: "Shared by: Sita",
//    postImageName: "pop3",
//    postDescription: "A new event guys at 5:30!",
//    like_count: "0"
//)
//
//
//var Posts: [Post] = [Post1, Post2]
//
//import UIKit
//
//// Struct representing an individual post
//struct PostItem {
//    let communityProfileImageName: String
//    let communityName: String
//    let sharedBy: String
//    let postImageName: String
//    let postDescription: String
//    var likeCount: Int
//    
//    mutating func incrementLikes() {
//        likeCount += 1
//    }
//}
//
//// Singleton class representing the Post data model
//class PostDataManager {
//    private static let shared = PostDataManager() // Singleton instance
//    
//    private var posts: [PostItem] = []
//    
//    private init() {
//        // Populate initial data
//        initializePosts()
//    }
//    
//    private func initializePosts() {
//        // Define your initial posts here
//        let post1 = PostItem(
//            communityProfileImageName: "pop_icon",
//            communityName: "Pop Dancers",
//            sharedBy: "Shared by: Shradha",
//            postImageName: "post1",
//            postDescription: "Hey all, We, as a team of 5, Sudhansu, Akhilesh, Rohit, Sagar, and Vaibhav coordinated a dance workshop today where we taught our peers dance on the latest trending song Kinni Kinni. The workshop was a big blast. Hope to see you all in the next workshop as well…",
//            likeCount: 245
//        )
//        
//        let post2 = PostItem(
//            communityProfileImageName: "hip_icon",
//            communityName: "Hip Hoppers",
//            sharedBy: "shared By: Jignesh",
//            postImageName: "post2",
//            postDescription: "Check out this amazing dance event!",
//            likeCount: 245
//        )
//        
//        let post3 = PostItem(
//            communityProfileImageName: "pop_icon",
//            communityName: "Pop Dancers",
//            sharedBy: "Shared by: Sita",
//            postImageName: "pop3",
//            postDescription: "A new event guys at 5:30!",
//            likeCount: 0
//        )
//        
//        // Add posts to the array
//        posts.append(contentsOf: [post1, post2, post3])
//    }
//    
//    // Function to fetch all posts
//    func fetchAllPosts() -> [PostItem] {
//        return posts
//    }
//    
//    // Function to fetch posts for this week
//    func fetchPostsForThisWeek() -> [PostItem] {
//        // Implement logic to filter posts for the current week
//        // For demonstration purposes, let's return all posts
//        return posts
//    }
//    
//    // Function to increment like count for a post
//    func incrementLikesForPost(at index: Int) {
//        guard index >= 0 && index < posts.count else { return }
//        posts[index].incrementLikes()
//    }
//}

struct PostItem {
    var communityProfileImageName: String
    var communityName: String
    var sharedBy: String
    var postImageName: String
    var postDescription: String
    var likeCount: String
}

class PostDataManager {
    private static let instance = PostDataManager() // Singleton instance
    
    private var posts: [PostItem] = []
    
    
    static func getInstance()->PostDataManager {
        return instance
    }
    
    init() {
        // Define your initial posts here
        let post1 = PostItem(
            communityProfileImageName: "pop_icon",
            communityName: "Pop Dancers",
            sharedBy: "Shared by: Shradha",
            postImageName: "post1",
            postDescription: "Hey all, We, as a team of 5, Sudhansu, Akhilesh, Rohit, Sagar, and Vaibhav coordinated a dance workshop today where we taught our peers dance on the latest trending song Kinni Kinni. The workshop was a big blast. Hope to see you all in the next workshop as well…",
            likeCount: "245"
        )
        
        let post2 = PostItem(
            communityProfileImageName: "hip_icon",
            communityName: "Hip Hoppers",
            sharedBy: "shared By: Jignesh",
            postImageName: "post2",
            postDescription: "Check out this amazing dance event!",
            likeCount: "245"
        )
        
        let post3 = PostItem(
            communityProfileImageName: "pop_icon",
            communityName: "Pop Dancers",
            sharedBy: "Shared by: Sita",
            postImageName: "pop3",
            postDescription: "A new event guys at 5:30!",
            likeCount: "0"
        )
        
        // Add posts to the array
        posts.append(contentsOf: [post1, post2, post3])
    }
    
    func getPosts()->[PostItem] {
        return posts
    }
    func addPost(post: PostItem) {
        posts.insert(post, at: 0)
    }
}

var dataModelofPosts: PostDataManager = PostDataManager()
