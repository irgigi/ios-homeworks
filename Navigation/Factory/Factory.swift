//
//  Factory.swift
//  Navigation


import UIKit

final class Factory {
    
    enum Flow {
        case first
        case second
    }
    
    private let flow: Flow
    let navigationController = UINavigationController()
    
    init(flow: Flow) {
        self.flow = flow
        startmodule()
    }
    
    private func startmodule() {
        switch flow {
        case .first:
            let coordinator = FeedCoordinator().startFeed()
            navigationController.tabBarItem = UITabBarItem(title: "Лента пользователя", image: UIImage(systemName: "heart"), selectedImage: nil)
            navigationController.setViewControllers([coordinator], animated: true)
    
            
        case .second:
            let coordinator = ProfileCoordinator().startProfile()
            navigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "house"), selectedImage: nil)
            navigationController.setViewControllers([coordinator], animated: true)
        }
    }
}
