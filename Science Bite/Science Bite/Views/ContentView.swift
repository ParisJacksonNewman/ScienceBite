//
//  ContentView.swift
//  Science Bite
//
//  Created by Paris Jackson-Newman on 10/06/2020.
//  Copyright © 2020 Paris Jackson-Newman. All rights reserved.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            // for every single post in the post array
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    VStack {
                        Text(post.title)
                            .bold()
                        HStack {
                                Text(post.description)
                                    .padding(.top)
                            URLImage(URL(string: post.urlToImage)!) { proxy in
                                proxy.image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .frame(width:150)
                        }
                    }
                }
            }
            .navigationBarTitle("Science Bite")
        }
            // This calls fetch data
            .onAppear {
                self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
