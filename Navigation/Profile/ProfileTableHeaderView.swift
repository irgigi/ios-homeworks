//
//  ProfileHeaderView.swift
//  Navigation
//
//

import UIKit
import SnapKit

class ProfileTableHeaderView: UITableViewHeaderFooterView {
  
    
    private var statusText:String
    
    
    // MARK: - Subviews
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Felix")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        //создание круглой рамки
        image.layer.cornerRadius = 60
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        
        return image
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Cat Felix"
        label.numberOfLines = 0
        
        return label
        
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        label.text = "My status"
        
        return label
    }()
  
    lazy var textField: UITextField = {
        let text = UITextField()
        
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = UIColor.black
        text.placeholder = " введите текст "
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.layer.cornerRadius = 12
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.backgroundColor = UIColor.white.cgColor
        text.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)

        return text
    }()
    
    lazy var bigButton: UIButton = {
        let button = UIButton(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 0,
                height: 0
            )
        )
        button.setTitle("Set status", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    
        return(button)
    }()

    override init(reuseIdentifier: String?) {
        statusText = ""
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        elementConstraint()
        elementSetup()
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
        addSubview(imageView)
        addSubview(bigButton)
        addSubview(textField)
        addSubview(statusLabel)
        addSubview(nameLabel)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
        
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
       
        if let showText = textField.text {
            print(showText)
        }
        
        if statusText .isEmpty {
            statusLabel.text = statusLabel.text
        } else {
            statusLabel.text = statusText
        }
        
    }
    
    private func elementSetup() {
        imageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(nameLabel.snp.leading).offset(-30)
            make.width.equalTo(120)
            make.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(27)
            make.leading.equalTo(imageView.snp.trailing)
            make.trailing.equalToSuperview().offset(16)
            make.bottom.equalTo(statusLabel.snp.top).offset(-20)
            make.height.equalTo(30)
        }
        
        statusLabel.snp.makeConstraints{ make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalTo(imageView.snp.trailing).offset(30)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(textField.snp.top).offset(-10)
            make.height.equalTo(20)
        }
        
        textField.snp.makeConstraints{ make in
            make.top.equalTo(statusLabel.snp.bottom)
            make.leading.equalTo(imageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(bigButton.snp.top).offset(-34)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        bigButton.snp.makeConstraints{ make in
            make.top.equalTo(textField.snp.bottom)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
    }
    
    func elementConstraint() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        bigButton.translatesAutoresizingMaskIntoConstraints = false
/*
        
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -30),

            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -20),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),

            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),

            textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.bottomAnchor.constraint(equalTo: bigButton.topAnchor, constant: -34),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.heightAnchor.constraint(equalToConstant: 40),

            bigButton.topAnchor.constraint(equalTo: textField.bottomAnchor),
            bigButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bigButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bigButton.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
*/
    }
    
}




