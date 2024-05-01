//
//  Post.swift
//  UConnect
//
//  Created by student on 30/04/24.
//

import Foundation

struct Post: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case communityProfileImageName
        case communityName
        case sharedBy
        case postImageName
        case postDescription
        case like_count
    }
    var id = UUID()
    var communityProfileImageName: String
    var communityName: String
    var sharedBy: String
    var postImageName: String
    var postDescription: String
    var like_count: String
}

class ReadJsonData: ObservableObject {
  @Published var posts = [Post]()

  init() {
    fetchData(completion: { posts in
      self.posts = posts
    })
  }

  func fetchData(completion: @escaping ([Post]) -> Void) {
    guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
      print("JSON file not found")
      return // Exit the function if URL retrieval fails
    }

    do {
      let data = try Data(contentsOf: url)
      let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
      completion(decodedPosts) // Call the completion handler with fetched posts
    } catch {
      print("Error fetching data:", error)
    }
  }
}

//let post1 = Post(communityProfileImageName: "pop_icon", communityName: "John Doe", sharedBy: "Ishika", postImageName: "post1", postDescription: "This is a great post!")
//let post2 = Post(communityProfileImageName: "hip_icon", communityName: "Jane Smith", sharedBy: "Ishika", postImageName: "post2", postDescription: "Check out this amazing photo!")
//
//var posts: [Post] = [post1, post2]
