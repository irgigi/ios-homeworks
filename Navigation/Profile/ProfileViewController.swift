//
//  ProfileViewController.swift
//  Navigation
//
//

import UIKit

class ProfileViewController: UIViewController {
  
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        title = "Profile" 
        view.addSubview(profileHeaderView)
        setupConstraints()
    }
 
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: 10
            ),
            
            profileHeaderView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: 10
            ),
            
            profileHeaderView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0
            ),
            profileHeaderView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0
            ),
            
            profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 220)
        ])
    }
     
}

