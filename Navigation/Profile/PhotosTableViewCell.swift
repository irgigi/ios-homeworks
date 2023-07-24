//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Мамуля on 11.07.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // MARK: -Elements
    
    let stackForImages: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        return stackView
    }()
    
    let stackUnderImages: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 250.0
        
        return stackView
    }()
    
    
    let image_1: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 6.0
        return image
    }()
    
    let image_2: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "felix2")
        image.clipsToBounds = true
        image.layer.cornerRadius = 6.0
        return image
    }()
    
    let image_3: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "felix3")
        image.clipsToBounds = true
        image.layer.cornerRadius = 6.0
        return image
    }()
    
    let image_4: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "felix4")
        image.clipsToBounds = true
        image.layer.cornerRadius = 6.0
        return image
    }()
    
    let label_1: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    let arrow: UILabel = {
        let label = UILabel()
        label.text = "->"
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    
    // MARK: - func
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
        
        addSubview(stackForImages)
        addSubview(stackUnderImages)
        stackUnderImages.addArrangedSubview(label_1)
        stackUnderImages.addArrangedSubview(arrow)
        stackForImages.addArrangedSubview(image_1)
        stackForImages.addArrangedSubview(image_2)
        stackForImages.addArrangedSubview(image_3)
        stackForImages.addArrangedSubview(image_4)
        constraintImages()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createImage(_ model: PostModel) {
        
        image_1.image = UIImage(named: model.image)
    }
    
    func constraintImages() {
        
        stackUnderImages.translatesAutoresizingMaskIntoConstraints = false
        label_1.translatesAutoresizingMaskIntoConstraints = false
        arrow.translatesAutoresizingMaskIntoConstraints = false
        stackForImages.translatesAutoresizingMaskIntoConstraints = false
        image_1.translatesAutoresizingMaskIntoConstraints = false
        image_2.translatesAutoresizingMaskIntoConstraints = false
        image_3.translatesAutoresizingMaskIntoConstraints = false
        image_4.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackUnderImages.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackUnderImages.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackUnderImages.bottomAnchor.constraint(equalTo: stackForImages.topAnchor, constant: -12),
            stackUnderImages.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackUnderImages.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackUnderImages.heightAnchor.constraint(equalToConstant: 50),
            
            label_1.topAnchor.constraint(equalTo: stackUnderImages.topAnchor),
            label_1.leadingAnchor.constraint(equalTo: stackUnderImages.leadingAnchor),
            label_1.leftAnchor.constraint(equalTo: stackUnderImages.leftAnchor),
            label_1.bottomAnchor.constraint(equalTo: stackUnderImages.bottomAnchor),
            label_1.heightAnchor.constraint(equalToConstant: 100),
            
            arrow.topAnchor.constraint(equalTo: stackUnderImages.topAnchor),
            arrow.trailingAnchor.constraint(equalTo: stackUnderImages.trailingAnchor),
            arrow.bottomAnchor.constraint(equalTo: stackUnderImages.bottomAnchor),
            arrow.rightAnchor.constraint(equalTo: stackUnderImages.rightAnchor),
            arrow.centerYAnchor.constraint(equalTo: label_1.centerYAnchor),
            arrow.heightAnchor.constraint(equalToConstant: 100),
            
            stackForImages.topAnchor.constraint(equalTo: stackUnderImages.bottomAnchor, constant: 12),
            stackForImages.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackForImages.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackForImages.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackForImages.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackForImages.heightAnchor.constraint(equalToConstant: 100),
            
            image_1.topAnchor.constraint(equalTo: stackForImages.topAnchor),
            image_1.bottomAnchor.constraint(equalTo: stackForImages.bottomAnchor),
            image_1.leadingAnchor.constraint(equalTo: stackForImages.leadingAnchor),
            image_1.trailingAnchor.constraint(equalTo: image_2.leadingAnchor, constant: -8),
            image_1.widthAnchor.constraint(equalToConstant: 80),
            image_1.heightAnchor.constraint(equalTo: stackForImages.heightAnchor),
            
            image_2.topAnchor.constraint(equalTo: stackForImages.topAnchor),
            image_2.bottomAnchor.constraint(equalTo: stackForImages.bottomAnchor),
            image_2.leadingAnchor.constraint(equalTo: image_1.trailingAnchor),
            image_2.trailingAnchor.constraint(equalTo: image_3.leadingAnchor, constant: -8),
            image_2.widthAnchor.constraint(equalToConstant: 80),
            image_2.heightAnchor.constraint(equalTo: stackForImages.heightAnchor),
            
            image_3.topAnchor.constraint(equalTo: stackForImages.topAnchor),
            image_3.bottomAnchor.constraint(equalTo: stackForImages.bottomAnchor),
            image_3.leadingAnchor.constraint(equalTo: image_2.trailingAnchor, constant: 8),
            image_3.trailingAnchor.constraint(equalTo: image_4.leadingAnchor, constant: -8),
            image_3.widthAnchor.constraint(equalToConstant: 80),
            image_3.heightAnchor.constraint(equalTo: stackForImages.heightAnchor),
            
            image_4.topAnchor.constraint(equalTo: stackForImages.topAnchor),
            image_4.bottomAnchor.constraint(equalTo: stackForImages.bottomAnchor),
            image_4.leadingAnchor.constraint(equalTo: image_3.trailingAnchor),
            image_4.widthAnchor.constraint(equalToConstant: 80),
            image_4.heightAnchor.constraint(equalTo: stackForImages.heightAnchor),
            image_4.trailingAnchor.constraint(equalTo: stackForImages.trailingAnchor)
            
            
            
        ])
        
    }
}
