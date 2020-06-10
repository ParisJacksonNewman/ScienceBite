//
//  PostData.swift
//  Science Bite
//
//  Created by Paris Jackson-Newman on 10/06/2020.
//  Copyright © 2020 Paris Jackson-Newman. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let articles: [Post]
}

struct Post: Decodable, Identifiable {
    let title, description, url, urlToImage: String
    let source: Source
    
    var id: String? {
        source.id
    }
}

struct Source: Decodable { 
    let id: String?
}

