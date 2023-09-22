//
//  FeedCoordinator.swift
//  Navigation


import UIKit

protocol FeedCoordinatorProtocol {
    
    func startFeed() -> UIViewController
    func startInfo() -> UIViewController
}

final class FeedCoordinator: FeedCoordinatorProtocol {

    func startFeed() -> UIViewController {
        return PostViewController()
    }
    
    func startInfo() -> UIViewController {
        return InfoViewController()
    }
    
}
