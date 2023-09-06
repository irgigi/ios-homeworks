//
//  FeedModel.swift
//  Navigation
//
//  Created by Мамуля on 02.09.2023.
//

import UIKit

class FeedModel {
    
    let secretWord: String = "testing"
    
    func check(word: String?) -> Bool {
        return word == secretWord
    }
}
