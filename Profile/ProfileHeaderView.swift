//
//  ProfileHeaderView.swift
//  Navigation
//
//

import UIKit

class ProfileHeaderView: UIView {
    
   // override func awakeFromNib() {
   //     super.awakeFromNib()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        self.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        //создание UIImageView с изображением
        let imageView = UIImageView(
            frame: CGRect(x: 16, y: 16, width: 120, height: 120)
            )
        imageView.image = UIImage(named: "Felix")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        
        //создание круглой рамки
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
    /*
        //создание label
        let label = UILabel(
            frame: CGRect(x: imageView.frame.midX, y: 27, width: 100, height: 50 )
            )
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Cat Felix"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
     */
        //добавление UIImageView на UIView
        addSubview(imageView)
       
        
    }

    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Cat Felix"
        //label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
  
}



