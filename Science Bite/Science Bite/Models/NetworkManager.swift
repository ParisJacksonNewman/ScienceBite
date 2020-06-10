//
//  NetworkManager.swift
//  Science Bite
//
//  Created by Paris Jackson-Newman on 10/06/2020.
//  Copyright © 2020 Paris Jackson-Newman. All rights reserved.
//

import Foundation

// Observable protocol means that it can start to broadcast one or many of its properties to any interested parties
class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        // 1. Create a URL
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=gb&category=science&apiKey=7806d7a294994cd2af9d272bbfe4f334") {
            
            // 2. Create a URLsession
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // Update must happen on the main thread, not in the background
                            DispatchQueue.main.async {
                                 self.posts = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
}
