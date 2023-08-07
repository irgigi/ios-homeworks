//
//  TestUserService.swift
//  Navigation


import UIKit

class TestUserService: UserServiceProtocol {
    
    
   let userTest: User? = User(login: "Test", name: "Test", status: "Test", avatar: UIImage(named: "VK") ?? UIImage())
   
   
    
    func getUserLogin(_ login: String) -> User? {
        guard let userTest = userTest, userTest.login == login else {
            return nil
        }
        return userTest
    }
    
    
}
