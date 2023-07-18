//
//  ProfileViewController.swift
//  Navigation
//
//

import UIKit

class ProfileViewController: UIViewController {

    let profileTableHeaderView = ProfileTableHeaderView()
    
    enum CellReuseID: String {
        case base = "BaseTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
   
    // MARK: - Data
    
    fileprivate let data = PostModel.make()
    
    // MARK: - table
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .grouped
        )
        
        tableView.rowHeight = UITableView.automaticDimension
        
        
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.base.rawValue
        )
        tableView.delegate = self
        tableView.dataSource = self
        
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        title = "Profile" 
       
        view.addSubview(profileTableHeaderView)
        profileTableHeaderView.addSubview(tableView)
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
 
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        profileTableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseID.base.rawValue,
            for: indexPath
        ) as? PostTableViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        cell.update(data[indexPath.row])
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}

