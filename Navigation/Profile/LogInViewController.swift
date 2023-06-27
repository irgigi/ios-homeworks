//
//  LogInViewController.swift
//  Navigation


import UIKit

class LogInViewController: UIViewController {
    
    let logInView = LogInView()
    
    lazy var vkView: UIImageView = {
        
        let image = UIImageView (
            frame: CGRect()
        )
        image.image = UIImage(named: "VK")
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(logInView)
        
        logInView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            logInView.topAnchor.constraint(equalTo: view.topAnchor),
            logInView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logInView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logInView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
        
        logInView.addSubview(vkView)
        self.setupElements()
        
    }
    
    func setupElements() {
        vkView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            vkView.topAnchor.constraint(equalTo: logInView.topAnchor, constant: 120),
            vkView.widthAnchor.constraint(equalToConstant: 100),
            vkView.heightAnchor.constraint(equalToConstant: 100),
            vkView.centerXAnchor.constraint(equalTo: logInView.centerXAnchor)
           
        ])
        
    }
}
