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
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    let planetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
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
       
        Planet.requestPlanets { [ weak self ] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let title):
                    self?.planetLabel.text = "Период обращения планеты Татуин вокруг своей звезды - \(title)"
                case .failure(_):
                    self?.planetLabel.text = "Ошибка"
                }
            }
        }
    
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemTeal
        
        view.addSubview(actionButton)
        view.addSubview(jsonLabel)
        view.addSubview(planetLabel)

        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            jsonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            jsonLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            jsonLabel.widthAnchor.constraint(equalToConstant: 200),
            //jsonLabel.bottomAnchor.constraint(equalTo: planetLabel.topAnchor),
            
            planetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //planetLabel.topAnchor.constraint(equalTo: jsonLabel.bottomAnchor),
            planetLabel.widthAnchor.constraint(equalToConstant: 200),
            planetLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
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
