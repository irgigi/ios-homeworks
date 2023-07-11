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
    let likes: Int
    let views: Int
}

extension PostModel {
    static func make() -> [PostModel] {
        [
            PostModel(author: "Felix",
                      description: "Me in 2 mounth",
                      image: "felix1",
                      likes: 10,
                      views: 135),
            
            PostModel(author: "Felix",
                      description: "Me in 12 years old",
                      image: "felix2",
                      likes: 2,
                      views: 80),
            
            PostModel(author: "Felix",
                      description: "Me and my favorite food",
                      image: "felix3",
                      likes: 7,
                      views: 56),
            
            PostModel(author: "Felix",
                      description: "My rest on the computer desk",
                      image: "felix4",
                      likes: 12,
                      views: 140),
        ]
    }
}
