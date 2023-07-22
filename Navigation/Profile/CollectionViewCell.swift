//
//  CollectionViewCell.swift
//  Navigation


import UIKit

class CollectionViewCell: UICollectionViewCell {
    
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
        super.init(frame: frame)
        
        addSubview(imageCell)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - public -
    
    func setupImage(_ model: PostModel) {
        imageCell.image = UIImage(named: model.image)
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
    
}

extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
