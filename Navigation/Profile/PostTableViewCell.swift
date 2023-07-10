//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Мамуля on 08.07.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let profileTableHeaderView = ProfileTableHeaderView()
    
    let autorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    let imagePost: UIImageView = {
        let image = UIImageView()
        image.draw(CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        return image
    }()
    
    // MARK: - Lifecycle
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
        
        addSubview(autorLabel)
        addSubview(imagePost)
        consraintInCell()


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
        
        autorLabel.text = model.author
        imagePost.image = UIImage(named: model.image)

          //detailTextLabel?.text = model.image
        }
    
    func consraintInCell() {
        
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            autorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            autorLabel.bottomAnchor.constraint(equalTo: imagePost.topAnchor, constant: 12),
            autorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            autorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            autorLabel.widthAnchor.constraint(equalTo: widthAnchor),
            autorLabel.heightAnchor.constraint(equalToConstant: 50),
            
            imagePost.topAnchor.constraint(equalTo: autorLabel.bottomAnchor),
            imagePost.bottomAnchor.constraint(equalTo: bottomAnchor),
            imagePost.leadingAnchor.constraint(equalTo: leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: trailingAnchor),
            imagePost.widthAnchor.constraint(equalTo: widthAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: 380)
        
        
        ])
        
    }
        
        
    
}
