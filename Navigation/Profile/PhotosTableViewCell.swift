//
//  PhotosTableViewCell.swift
//  Navigation


import UIKit

class PhotosTableViewCell: UICollectionViewCell {
    
    
    let imageCell: UIImageView = {
        let image = UIImageView(frame: .zero)
        let screenWidth = UIScreen.main.bounds.width
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.layer.cornerRadius = 6.0
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(imageCell)
        
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setup -
    
    private func setupLayouts() {
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageCell.topAnchor.constraint(equalTo: topAnchor),
            imageCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageCell.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - public -
    
    func setupImage(with model: PostModel) {
        imageCell.image = UIImage(named: model.image)
    }
}
