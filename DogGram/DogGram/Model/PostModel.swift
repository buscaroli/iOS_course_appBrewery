//
//  PostModel.swift
//  DogGram
//
//  Created by Matteo on 23/04/2022.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    var id = UUID()
    var postID: String // ID for post in DB
    var userID: String // ID for Uuser in DB
    var username: String
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
