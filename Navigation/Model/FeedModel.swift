//
//  FeedModel.swift
//  Navigation


import UIKit

class FeedModel {
    
    let secretWord: String = "testing"
    
    func check(word: String?) -> Bool {
        return word == secretWord
    }
}
