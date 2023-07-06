//
//  ProfileTableHeaderView.swift
//  Navigation

//

import UIKit

class ProfileTableHeaderView: UIView {
    
    // MARK: - Data
    
    fileprivate let data = PostModel.make()
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private enum CellReuseID: String {
        case base = "BaseTableViewCell_ReuseID"
        case custom = "CustomTableViewCell_ReuseID"
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let profileHeaderView = ProfileHeaderView()
        self.addSubview(profileHeaderView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
