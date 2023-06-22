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
        self.addSubview(imageView)
        self.addSubview(bigButton)

 /*
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
   */
    }
    
    override func layoutSubviews() {
        addSubview(nameLabel)
        addSubview(bigButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let image = UIImageView(
            frame: CGRect(x: 16, y: 16, width: 120, height: 120)
            )
        image.image = UIImage(named: "Felix")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        //создание круглой рамки
        image.layer.cornerRadius = image.frame.size.width / 2
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        
        
        return image
    }()
  /*
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
       
 
        //создание label
        let label = UILabel(
            frame: CGRect(x: 200, y: 27, width: 100, height: 50 )
            )
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Cat Felix"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        //добавление UIImageView на UIView
        addSubview(imageView)
 //       addSubview(label)
       
        
    }

   */
    let nameLabel: UILabel = {
        let label = UILabel(
            frame: CGRect(x: 160, y: 27, width: 100, height: 50 )
        )
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Cat Felix"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    lazy var bigButton: UIButton = {
        let button = UIButton(
            frame: CGRect(
                x: 16,
                y: 16 + 120 + 16,
                width: 380,
                height: 50
            )
        )
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    
        
        return(button)
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
        if let title = sender.currentTitle {
            print(title)
        }
        
    }
    
}



