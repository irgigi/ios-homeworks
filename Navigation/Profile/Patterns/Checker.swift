//
//  Checker.swift
//  Navigation


import UIKit

class Checker: LoginViewControllerDelegate {
    
    static let shared = Checker()
    
    private let loginUser = "test@mail.ru"
    private let passwordUser = "123456"
    
    private init() {}
    
    
    
    func check(_ login: String?, _ password: String?) -> Bool {
        return login == loginUser && password == passwordUser
    }
    
}
