//
//  FeedView.swift
//  DogGram
//
//  Created by Matteo on 23/04/2022.
//

import SwiftUI


struct FeedView: View {
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack{
                ForEach(posts.dataArray, id: \.self) { post in
                    PostView(post:post)
                }
            }
            
        })
        .navigationBarTitle("FEED VIEW")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(posts: PostArrayObject())
        }
        
    }
}
