//
//  PostViewController.swift
//  Navigation


import UIKit

class PostViewController: UIViewController {
    
    var navBarButton: UIBarButtonItem!
    var coordinator = FeedCoordinator()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navBarButton = UIBarButtonItem(
            title: "Инфо",
            style: .plain,
            target: self,
            action: #selector(buttonPressed)
            )
        navigationItem.rightBarButtonItem = navBarButton
        
        let feedController = FeedViewController()
        let myTitle = feedController.post.title
        view.backgroundColor = .systemMint
        title = myTitle

    }
    
    @objc func buttonPressed() {
        
        let controller = coordinator.startInfo()
        controller.modalTransitionStyle = .coverVertical
        controller.modalPresentationStyle = .pageSheet
        present (controller, animated: true, completion: nil)
        
    }
    
    
}
