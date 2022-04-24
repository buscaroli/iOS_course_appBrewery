//
//  PostArrayObject.swift
//  DogGram
//
//  Created by Matteo on 23/04/2022.
//

import Foundation

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel]()
    
    init() {
        print("FETCH FROM DATABASE IN HERE")
        
        let post1 = PostModel(postID: "", userID: "", username: "John Berry", caption: "Wonderful day!", dateCreated: Date(), likeCount: 2, likedByUser: true)
        let post2 = PostModel(postID: "", userID: "", username: "Susan Bartlett", caption: "Hello everyone!", dateCreated: Date(), likeCount: 15, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", username: "Bob Malcolm", caption: "Anybody seen this before?", dateCreated: Date(), likeCount: 2, likedByUser: true)
        let post4 = PostModel(postID: "", userID: "", username: "Carolyn Beaver", caption: "It was lovely to see you all!", dateCreated: Date(), likeCount: 45, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    /// USE FOR SINGLE POST SELECTION
    init(post: PostModel) {
        self.dataArray.append(post)
    }
}
