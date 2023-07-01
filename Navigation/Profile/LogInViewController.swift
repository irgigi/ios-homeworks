//
//  LogInViewController.swift
//  Navigation


import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    private lazy var scrollFieldView: UIScrollView = {
        let scrollFieldView = UIScrollView()
        scrollFieldView.showsVerticalScrollIndicator = true
        scrollFieldView.showsHorizontalScrollIndicator = false
        return scrollFieldView
    }()
    
    lazy var vkView: UIImageView = {
        
        let image = UIImageView (
            frame: CGRect()
        )
        image.image = UIImage(named: "VK")
        
        return image
    }()
    
    
    lazy var loginField: UITextField = {
        let text = UITextField()
        
        text.backgroundColor = .systemGray6
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.placeholder = "Email of phone"
        text.textColor = UIColor.black
        text.tintColor = UIColor(named: "MyColor")
       // text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.autocapitalizationType = .none
        text.keyboardType = .default
        text.returnKeyType = .done
        text.clearButtonMode = .whileEditing
        text.contentVerticalAlignment = .center
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.borderWidth = 0.5
        text.layer.cornerRadius = 10
        
        text.delegate = self
        
        return text
    }()
    
    lazy var passwordField: UITextField = {
        let text = UITextField()
        
        text.backgroundColor = .systemGray6
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.placeholder = "Password"
        text.textColor = UIColor.black
        text.tintColor = UIColor(named: "MyColor")
       // text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.autocapitalizationType = .none
        text.keyboardType = .default
        text.returnKeyType = .done
        text.clearButtonMode = .whileEditing
        text.contentVerticalAlignment = .center
        text.isSecureTextEntry = true
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.layer.borderWidth = 0.5
        text.layer.cornerRadius = 10
        
        text.delegate = self
        
        return text
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .custom)
        let bluePixelImage = UIImage(named: "blue_pixel")
        button.setBackgroundImage(bluePixelImage, for: .normal)
        button.backgroundImage(for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .vertical)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    lazy var stackViewForFields: UIStackView = {
        let stackViewForFields = UIStackView()
        stackViewForFields.axis = .vertical
        stackViewForFields.alignment = .fill
        stackViewForFields.distribution = .fillEqually
        stackViewForFields.spacing = 0
        return stackViewForFields
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        view.addSubview(vkView)
        view.addSubview(scrollFieldView)
        scrollFieldView.addSubview(stackViewForFields)
        scrollFieldView.addSubview(logInButton)
        stackViewForFields.addSubview(loginField)
        stackViewForFields.addSubview(passwordField)
        
        self.setupElements()
        
    }
    
    private func setupElements() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        scrollFieldView.translatesAutoresizingMaskIntoConstraints = false
        vkView.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        stackViewForFields.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            vkView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 120),
            vkView.widthAnchor.constraint(equalToConstant: 100),
            vkView.heightAnchor.constraint(equalToConstant: 100),
            vkView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            
            scrollFieldView.topAnchor.constraint(equalTo: vkView.bottomAnchor, constant: 120),
            scrollFieldView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16),
            scrollFieldView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16),
            scrollFieldView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            scrollFieldView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            
            stackViewForFields.topAnchor.constraint(equalTo: scrollFieldView.topAnchor),
            stackViewForFields.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor),
            stackViewForFields.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor),
            stackViewForFields.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -16),
            stackViewForFields.centerXAnchor.constraint(equalTo: scrollFieldView.centerXAnchor),
        
            loginField.topAnchor.constraint(equalTo: stackViewForFields.topAnchor),
            loginField.leadingAnchor.constraint(equalTo: stackViewForFields.leadingAnchor),
            loginField.trailingAnchor.constraint(equalTo: stackViewForFields.trailingAnchor),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            loginField.widthAnchor.constraint(equalTo: stackViewForFields.widthAnchor),
            loginField.bottomAnchor.constraint(equalTo: passwordField.topAnchor),
            //loginField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: stackViewForFields.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: stackViewForFields.trailingAnchor),
            passwordField.widthAnchor.constraint(equalTo: stackViewForFields.widthAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.bottomAnchor.constraint(equalTo: stackViewForFields.bottomAnchor),
            
            logInButton.topAnchor.constraint(equalTo: stackViewForFields.bottomAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.widthAnchor.constraint(equalTo: stackViewForFields.widthAnchor),
            logInButton.leadingAnchor.constraint(equalTo: stackViewForFields.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: stackViewForFields.trailingAnchor),
            logInButton.bottomAnchor.constraint(equalTo: stackViewForFields.bottomAnchor)
       
        ])
        
    }
}
