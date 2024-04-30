//
//  Post.swift
//  UConnect
//
//  Created by student on 30/04/24.
//

import Foundation

struct Post {
    let communityProfileImageName: String
    let communityName: String
    let sharedBy: String
    let postImageName: String
    let postDescription: String
}

let post1 = Post(communityProfileImageName: "pop_icon", communityName: "John Doe", sharedBy: "Ishika", postImageName: "post1", postDescription: "This is a great post!")
let post2 = Post(communityProfileImageName: "hip_icon", communityName: "Jane Smith", sharedBy: "Ishika", postImageName: "post2", postDescription: "Check out this amazing photo!")

var posts: [Post] = [post1, post2]
