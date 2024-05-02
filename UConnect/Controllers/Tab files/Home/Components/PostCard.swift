//
//  PostCard.swift
//  UConnect
//
//  Created by student on 30/04/24.
//

import SwiftUI

struct PostCard: View {
    
    let communityProfileImageName: String
    let communityName: String
    let sharedBy: String
    
    let postImageName: String
    let postDescription: String
    let like_count: String
//    
    var body: some View {
        VStack {
            PostCardHeader(communityProfileImageName: communityProfileImageName, communityName: communityName, sharedBy: sharedBy)
            PostCardBody(postImageName: postImageName, postDescription: postDescription, like_count: like_count)
        }
    }
}

