//
//  InfoViewController.swift
//  Navigation

import UIKit

class InfoViewController: UIViewController {
    
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
        return button
       }()
    
    let jsonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JSONModel.request { [weak self ]result in
            DispatchQueue.main.async {
                switch result {
                case .success(let title):
                    self?.jsonLabel.text = title
                case .failure(_):
                    self?.jsonLabel.text = "Ошибка"
                }
            }
        }
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        view.addSubview(actionButton)
        view.addSubview(jsonLabel)

        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            jsonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jsonLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            jsonLabel.widthAnchor.constraint(equalToConstant: 200)
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
