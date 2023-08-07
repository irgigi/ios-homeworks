//
//  CurrentUserService.swift
//  Navigation


import UIKit

class CurrentUserService: UserServiceProtocol {
    
    var currentUser: User?
    

 
    func getUserLogin(_ login: String) -> User? {
        guard let currentUser = currentUser, currentUser.login == login else {
            return nil
        }
        return currentUser
    }
    
}
