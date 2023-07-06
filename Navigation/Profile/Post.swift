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
            PostModel(author: "",
                      description: "",
                      image: "",
                      likes: 0,
                      views: 0)
        ]
    }
}
