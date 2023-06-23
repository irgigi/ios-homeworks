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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(
                equalTo: safeAreaGuide.leadingAnchor,
                constant: 0
            ),
            profileHeaderView.trailingAnchor.constraint(
                equalTo: safeAreaGuide.trailingAnchor,
                constant: 0
            ),
        
            profileHeaderView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: 10
            ),
            
            profileHeaderView.bottomAnchor.constraint(
                equalTo: safeAreaGuide.bottomAnchor,
                constant: 10
            )
            
            //profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
     
}

