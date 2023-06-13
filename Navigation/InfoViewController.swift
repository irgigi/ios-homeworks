//
//  InfoViewController.swift
//  Navigation
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
