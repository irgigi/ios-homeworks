//
//  LogInViewController.swift
//  Navigation


import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    
    private lazy var scrollFieldView: UIScrollView = {
        let scrollFieldView = UIScrollView()
        //scrollFieldView.showsVerticalScrollIndicator = true
        //scrollFieldView.showsHorizontalScrollIndicator = false
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
        let button = UIButton()
        button.backgroundColor = .blue
        button.backgroundImage(for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    
        view.addSubview(vkView)
        view.addSubview(scrollFieldView)
        scrollFieldView.addSubview(loginField)
        scrollFieldView.addSubview(passwordField)
        scrollFieldView.addSubview(logInButton)
        self.setupElements()
        
    }
    
    func setupElements() {
        scrollFieldView.translatesAutoresizingMaskIntoConstraints = false
        vkView.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            vkView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            vkView.widthAnchor.constraint(equalToConstant: 100),
            vkView.heightAnchor.constraint(equalToConstant: 100),
            vkView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollFieldView.topAnchor.constraint(equalTo: vkView.bottomAnchor, constant: 120),
            scrollFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollFieldView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            loginField.topAnchor.constraint(equalTo: scrollFieldView.topAnchor),
            loginField.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor),
            loginField.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            loginField.bottomAnchor.constraint(equalTo: passwordField.topAnchor),
            //loginField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

      /*
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor),
            logInButton.bottomAnchor.constraint(equalTo: scrollFieldView.bottomAnchor)
       */
        ])
        
    }
}
