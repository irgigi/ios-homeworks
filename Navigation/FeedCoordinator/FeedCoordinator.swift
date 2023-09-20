//
//  FeedCoordinator.swift
//  Navigation


import UIKit

protocol FeedCoordinatorProtocol {
    func startFeed() -> UIViewController
}

final class FeedCoordinator {
    
    func startFeed() -> UIViewController {
        
        return FeedViewController()
    }
    
    
}
