//
//  LogInViewController.swift
//  Navigation


import UIKit

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logInView = LogInView()
        view.addSubview(logInView)
        
        logInView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            logInView.topAnchor.constraint(equalTo: view.topAnchor),
            logInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logInView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        
    }
}
