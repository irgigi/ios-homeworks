//
//  MainCoordinator.swift
//  Navigation


import UIKit

protocol MainCoordinatorProtocol {
    
    func startApplication() -> UIViewController
    
}

final class MainCoordinator: MainCoordinatorProtocol {
    func startApplication() -> UIViewController {
        //первоначальная логика - куда переместить пользователя
        return MainTabBarController()
    }
    
    
}
