//
//  ProfileViewController.swift
//  Navigation
//
//

import UIKit
import StorageService

class ProfileViewController: UIViewController {

    let profileTableHeaderView = ProfileTableHeaderView()
    
    enum CellReuseID: String {
        case base = "BaseTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
    
    private enum HeaderFooterReuseID: String {
        case base = "TableSelectionFooterHeaderView_ReuseID"
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
        
        tableView.setAndLayout(headerView: profileTableHeaderView)
        
        
        tableView.register(
            ProfileTableHeaderView.self,
            forHeaderFooterViewReuseIdentifier: HeaderFooterReuseID.base.rawValue
        )
         
        tableView.delegate = self
        tableView.dataSource = self
        
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        #if DEBUG
        view.backgroundColor = .lightGray
        #else
        view.backgroundColor = .red
        #endif
        
        title = "Profile" 
       
        tableView.addSubview(profileTableHeaderView)
        view.addSubview(tableView)
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
            
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor)
            
        ])
        
    }
     
}

extension UITableView {
    
    func setAndLayout(headerView: UIView) {
        tableHeaderView = headerView
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        headerView.frame.size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
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
        return 250
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
      
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderFooterReuseID.base.rawValue
        ) as? ProfileTableHeaderView else {
            fatalError("could not dequeueReusableCell")
        }
        
        return headerView
       
    }
    
    
}

