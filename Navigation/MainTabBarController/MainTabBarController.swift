//
//  MainTabBarController.swift
//  Navigation


import UIKit

final class MainTabBarController: UITabBarController {
    private let firstVC = Factory(flow: .first)
    private let secodVC = Factory(flow: .second)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
    }
    
    private func setControllers() {
        viewControllers = [firstVC.navigationController, secodVC.navigationController]
    }
}
