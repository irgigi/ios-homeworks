//
//  Post.swift
//  Navigation
//

//

import Foundation

struct PostModel {
    let author: String
    let description: String
    let image: String
    let likes: Int16
    let views: Int16
}

extension PostModel {
    static func make() -> [PostModel] {
        [
            PostModel(author: "Felix",
                      description: "Me in 2 mounth",
                      image: "felix1",
                      likes: 1,
                      views: 1),
            
            PostModel(author: "Felix",
                      description: "Me in 12 years old",
                      image: "felix2",
                      likes: 1,
                      views: 1),
            
            PostModel(author: "Felix",
                      description: "Me and my favorite food",
                      image: "felix3",
                      likes: 1,
                      views: 1),
            
            PostModel(author: "Felix",
                      description: "My rest on the computer desk",
                      image: "felix4",
                      likes: 1,
                      views: 1),
            
            PostModel(author: "Felix",
                      description: "My paws",
                      image: "felix5",
                      likes: 1,
                      views: 1),
            
        ]
    }
}
