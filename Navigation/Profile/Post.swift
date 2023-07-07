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
            PostModel(author: ProfileHeaderView().nameLabel.text ?? "Felix",
                      description: "Me in 2 mounth",
                      image: "felix1",
                      likes: 0,
                      views: 0)
        ]
    }
}
