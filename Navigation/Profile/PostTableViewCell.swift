//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Мамуля on 08.07.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Lifecycle
        
        override init(
            style: UITableViewCell.CellStyle,
            reuseIdentifier: String?
        ) {
            super.init(
                style: .subtitle,
                reuseIdentifier: reuseIdentifier
            )

          //  tuneView()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            
            isHidden = false
            isSelected = false
            isHighlighted = false
        }
        
     
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            guard let view = selectedBackgroundView else {
                return
            }
            
            contentView.insertSubview(view, at: 0)
            selectedBackgroundView?.isHidden = !selected
        }
    
    func update(_ model: PostModel) {
            textLabel?.text = model.author
            detailTextLabel?.text = model.image
        }
    
}
