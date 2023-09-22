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
            let controller = FeedViewController()
            navigationController.tabBarItem = UITabBarItem(title: "Лента пользователя", image: UIImage(systemName: "heart"), selectedImage: nil)
            navigationController.setViewControllers([controller], animated: true)
    
            
        case .second:
            let controller = LogInViewController()
            navigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "house"), selectedImage: nil)
            navigationController.setViewControllers([controller], animated: true)
        }
    }
}
