//
//  PostViewController.swift
//  Navigation
//
//  Created by Мамуля on 13.06.2023.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let feedController = FeedViewController()
        let myTitle = feedController.post.title
        view.backgroundColor = .systemMint
        title = myTitle
        

        let button = UIButton(type: .system)
        //button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.setTitle("Инфо", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func buttonPressed() {
        
        let infoController = InfoViewController()
        infoController.modalTransitionStyle = .coverVertical
        infoController.modalPresentationStyle = .pageSheet
        present (infoController, animated: true, completion: nil)
        
    }
    
    
}
