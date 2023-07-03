//
//  LogInViewController.swift
//  Navigation


import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    
    private lazy var scrollFieldView: UIScrollView = {
        let scrollFieldView = UIScrollView()
        scrollFieldView.showsVerticalScrollIndicator = true
        scrollFieldView.showsHorizontalScrollIndicator = false
        scrollFieldView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
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
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
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
        
        //text.delegate = self
        
        return text
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        let bluePixelImage = UIImage(named: "blue_pixel")
        button.setBackgroundImage(bluePixelImage, for: .normal)
        button.backgroundImage(for: .normal)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        //button.setContentHuggingPriority(.required, for: .horizontal)
        //button.setContentHuggingPriority(.required, for: .vertical)
        //button.setContentCompressionResistancePriority(.required, for: .horizontal)
        //button.setContentCompressionResistancePriority(.required, for: .vertical)
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(buttonToProfile), for: .touchUpInside)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
 
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
        
    }
    
    
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func buttonToProfile() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollFieldView.contentInset.bottom += keyboardHeight ?? 0.0
        
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollFieldView.contentInset.bottom = 0.0
    }
 
    func textFieldShouldReturn(
        _ loginField: UITextField
    ) -> Bool {
        loginField.resignFirstResponder()
       // passwordField.resignFirstResponder()
        
        return true
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
            stackViewForFields.heightAnchor.constraint(equalToConstant: 100),
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
            logInButton.widthAnchor.constraint(equalTo: scrollFieldView.widthAnchor),
            logInButton.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor),
            logInButton.bottomAnchor.constraint(equalTo: scrollFieldView.bottomAnchor)
       
        ])
        
    }
    
    
}

