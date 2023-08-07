//
//  UserServiceProtocol.swift
//  Navigation

import Foundation

protocol UserServiceProtocol {
    
    func getUserLogin(_ login: String) -> User?
    
}
