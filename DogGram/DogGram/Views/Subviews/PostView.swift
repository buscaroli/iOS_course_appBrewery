//
//  PostView.swift
//  DogGram
//
//  Created by Matteo on 23/04/2022.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            // MARK: HEADER
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30, alignment: .center
                    )
                .cornerRadius(15)
                
                Text(post.username)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .font(.headline)
            }
            .padding(.all, 6)
            
            // MARK: IMAGE
            
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            // MARK: FOOTER
            
            HStack(alignment: .center, spacing: 20, content: {
                
                Image(systemName: "heart")
                    .font(.title3)
                
                NavigationLink(destination: CommentsView(), label: {
                    Image(systemName: "bubble.middle.bottom")
                        .font(.title3)
                        .foregroundColor(.primary)
                })
                
                    
                
                Image(systemName: "paperplane")
                    .font(.title3)
                
                Spacer()
            })
            .padding(.all, 6)
            
            if let caption = post.caption {
                HStack {
                    Text(caption)
                    Spacer(minLength: 0)
                }
                .padding(.all, 6)
            }
            
        })
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel( postID: "abcd", userID: "abcdef", username: "Kevin Smith", caption: "This is a fixed caption text.", dateCreated: Date(), likeCount: 5, likedByUser: false)
    
    static var previews: some View {
        PostView(post: post)
            .previewLayout(.sizeThatFits)
    }
}
