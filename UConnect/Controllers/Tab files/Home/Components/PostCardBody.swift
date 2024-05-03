////
////  PostCardBody.swift
////  UConnect
////
////  Created by student on 30/04/24.
////
//
//import SwiftUI
//
//struct PostCardBody: View {
//    
//    let postImageName: String
//    let postDescription: String
//    let like_count: String
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            Image(postImageName).resizable().aspectRatio(contentMode: .fit).roundedCorner(20, corners: [.bottomLeft, .topRight, .bottomRight])
//            
//            HStack{
//                HStack(spacing: 3){
//                    Image(systemName: "heart")
//                    Text(like_count)
//                    
//                }
//                Spacer()
//                HStack{
//                    Image(systemName: "text.bubble")
//                    Text(like_count)
//                }
//            }.font(.callout)
//            
//            Text(postDescription).lineLimit(2).multilineTextAlignment(.leading).font(.callout).foregroundColor(.gray)
//        }
//        .padding(.leading, 55)
//    }
//}
//
////#Preview {
////    PostCardBody()
////}
