//
//  Post.swift
//  UConnect
//
//  Created by student on 30/04/24.
//

import Foundation

struct Post {
    var communityProfileImageName: String
    var communityName: String
    var sharedBy: String
    var postImageName: String
    var postDescription: String
    var like_count: String
}
//struct Post: Codable, Identifiable {
//    enum CodingKeys: CodingKey {
//        case communityProfileImageName
//        case communityName
//        case sharedBy
//        case postImageName
//        case postDescription
//        case like_count
//    }
//    var id = UUID()
//    var communityProfileImageName: String
//    var communityName: String
//    var sharedBy: String
//    var postImageName: String
//    var postDescription: String
//    var like_count: String
//}
//
//class ReadJsonData: ObservableObject {
//  @Published var posts = [Post]()

//  init() {
//    fetchData(completion: { posts in
//      self.posts = posts
//    })
//  }

//  func fetchData(completion: @escaping ([Post]) -> Void) {
//    guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
//      print("JSON file not found")
//      return // Exit the function if URL retrieval fails
//    }
//
//    do {
//      let data = try Data(contentsOf: url)
//      let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
//      completion(decodedPosts) // Call the completion handler with fetched posts
//    } catch {
//      print("Error fetching data:", error)
//    }
//  }
//}

let Post1 = Post(communityProfileImageName: "pop_icon", communityName: "Pop Dancers", sharedBy: "Shared by: Shradha", postImageName: "post1", postDescription: "Hey all,We, as a team of 5, Sudhansu, Akhilesh, Rohit, Sagar, and Vaibhav coordinated a dance workshop today where we taught our peers dance on latest trending song Kinni Kinni. The workshop was a big blast. Hope to see you all in the next workshop as well… ", like_count: "245")

let Post2 = Post(communityProfileImageName: "hip_icon", communityName: "Hip Hoppers", sharedBy: "shared By: Jignesh", postImageName: "post2", postDescription: "Check out this amazing dance event!", like_count: "245")

var Posts: [Post] = [Post1, Post2]
