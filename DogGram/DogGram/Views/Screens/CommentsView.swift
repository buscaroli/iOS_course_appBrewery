//
//  CommentsView.swift
//  DogGram
//
//  Created by Matteo on 23/04/2022.
//

import SwiftUI

struct CommentsView: View {
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) {comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a Comment here...", text: $submissionText)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(Color.MyTheme.purpleColor)
            }
            .padding(.all, 6)
        }
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            getComments()
        })
    }
    
    func getComments() {
        print("GET COMMENTS FROM DATABASE")
        
        let comment1 = CommentModel(commentID: "", userID: "", username: "Jack Malcolm", content: "Great picture, great dog!", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "Alex Briggs", content: "Just so so... a bit disappointed", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Sue Harlock", content: "She looks like my Penny! Wonderful!", dateCreated: Date())
        let comment4 = CommentModel(commentID: "", userID: "", username: "Johnny Goodenough", content: "Meh hehe cuteeee", dateCreated: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)
    }
}


struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CommentsView()
        }
        
    }
}
