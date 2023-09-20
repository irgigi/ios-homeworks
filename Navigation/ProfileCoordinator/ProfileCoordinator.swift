//
//  ProfileCoordinator.swift
//  Navigation


import UIKit

protocol ProfileCoordinatorProtocol {
    func startProfile() -> UIViewController
}

final class ProfileCoordinator {
    
    func startProfile() -> UIViewController {
        
        return LogInViewController()
    }
    
    
}
