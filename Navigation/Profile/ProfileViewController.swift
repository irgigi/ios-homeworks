//
//  ProfileViewController.swift
//  Navigation
//
//

import UIKit

class ProfileViewController: UIViewController {

    let profileTableHeaderView = ProfileTableHeaderView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        title = "Profile" 
       
        view.addSubview(profileTableHeaderView)
        setupConstraints()
    }
 
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        profileTableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            profileTableHeaderView.topAnchor.constraint(
                equalTo: safeAreaGuide.topAnchor,
                constant: 10
            ),
            
            profileTableHeaderView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: 10
            ),
            
            profileTableHeaderView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 0
            ),
            profileTableHeaderView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: 0
            ),
            
            profileTableHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 220)
        ])
    }
     
}


