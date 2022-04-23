//
//  ContentView.swift
//  DogGram
//
//  Created by Matteo on 23/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView{
                FeedView(posts: PostArrayObject())
            }
            .tabItem {
                Image(systemName: "book.fill")
                Text("Feed")
                    
                
            }
            Text("Screen 2")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            Text("Screen 3")
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Feed")
                }
            Text("Screen 4")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
        }
        .accentColor(Color.MyTheme.purpleColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
