//
//  Post.swift
//  Navigation
//

//

import Foundation

public struct PostModel {
    public let author: String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int
}

extension PostModel {
    public static func make() -> [PostModel] {
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
        ]
    }
}
