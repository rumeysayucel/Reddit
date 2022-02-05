//
//  ContentView.swift
//  Reddit
//
//  Created by Rumeysa Yücel on 5.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.data.url)){
                    HStack {
                        Text(post.data.title)
                    }
                }
               
            }
            .navigationBarTitle("Reddit News")
        }
        .onAppear(){
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
