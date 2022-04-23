//
//  CommentModel.swift
//  DogGram
//
//  Created by Matteo on 23/04/2022.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    var id = UUID()
    var commentID: String // ID for the comment in the DB
    var userID: String
    var username: String
    var content: String // comment text
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
