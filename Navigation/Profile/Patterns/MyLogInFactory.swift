//
//  MyLogInFactory.swift
//  Navigation


import UIKit

struct MyLogInFactory: LoginFactory {
    
    func makeLoginInspector() -> LoginInspector {
        let loginInspector = LoginInspector()
        return LoginInspector()
    }
    
    
}
