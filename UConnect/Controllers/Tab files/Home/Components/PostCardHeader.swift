//
//  PostCardHeader.swift
//  UConnect
//
//  Created by student on 30/04/24.
//

import SwiftUI

struct PostCardHeader: View {
    
//    let communityProfileImageName: String
//    let communityName: String
//    let sharedBy: String
    
    var body: some View {
        HStack {
            Image("pop_icon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text("Pop Dancers").bold()
                Text("Ishika").font(.footnote).foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
            
        }
    }
}

