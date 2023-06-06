//
//  ViewController.swift
//  Navigation
//
//  Created by Мамуля on 03.06.2023.
//

import UIKit


class InfoViewController: UIViewController {
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
           return button
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        view.addSubview(actionButton)

        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
 
        actionButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    @objc func showAlert() {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "action 1", style: .default) { _ in
            print("action 1 - done")
        }
        
        let action2 = UIAlertAction(title: "action 2", style: .default) { _ in
            print("action 2 - done")
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
    
}


struct Post {
    var title: String
}


class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemCyan
            
        let button = UIButton(type: .system)
        button.setTitle(post.title, for: .normal)
        button.addTarget(self, action: #selector(goToPosrtViewController), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
            
        view.addSubview(button)
    }
        
    @objc func goToPosrtViewController() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
        
        
}
    
class ProfileViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemYellow
    }
        
        
}

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
    
    

