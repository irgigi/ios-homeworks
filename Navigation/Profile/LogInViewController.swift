//
//  LogInViewController.swift
//  Navigation


import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var loginDelegate: LoginViewControllerDelegate?

    private let checkerService = CheckerService()
    
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
        text.placeholder = "login"
        //text.text = "felix04"
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
        text.tag = 0
        
        
        return text
    }()
    
    lazy var passwordField: UITextField = {
        let text = UITextField()
        
        text.backgroundColor = .systemGray6
        text.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text.placeholder = "password"
        //text.text = "1507"
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
        text.tag = 1
        
        return text
    }()
    
    let spaceView = UIView()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        let bluePixelImage = UIImage(named: "blue_pixel")
        button.setBackgroundImage(bluePixelImage, for: .normal)
        button.backgroundImage(for: .normal)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(buttonToProfile), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        let bluePixelImage = UIImage(named: "blue_pixel")
        button.setBackgroundImage(bluePixelImage, for: .normal)
        button.backgroundImage(for: .normal)
        button.setTitle("Зарегестрироваться", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(buttonToProfile), for: .touchUpInside)
        return button
    }()
    
    lazy var stackViewForFields: UIStackView = {
        let stackViewForFields = UIStackView()
        stackViewForFields.axis = .vertical
        stackViewForFields.alignment = .fill
        stackViewForFields.distribution = .fillEqually
        stackViewForFields.spacing = 0.5
        return stackViewForFields
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(vkView)
        view.addSubview(scrollFieldView)
        scrollFieldView.addSubview(stackViewForFields)
        scrollFieldView.addSubview(logInButton)
        scrollFieldView.addSubview(signUpButton)
        stackViewForFields.addArrangedSubview(loginField)
        stackViewForFields.addArrangedSubview(passwordField)
        stackViewForFields.addArrangedSubview(spaceView)
        
        self.setupElements()
        
        self.loginField.delegate = self
        self.passwordField.delegate = self
        

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    /*
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        return loginField.resignFirstResponder()
    }
    */
    override func touchesBegan(_ textField: Set<UITouch>, with event: UIEvent?) {
        self.scrollFieldView.endEditing(true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
 
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        loginField.text = ""
        passwordField.text = ""
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
    
    //проверка на правильность ввода
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let emeilText = loginField.text ?? ""
        let passwordText = passwordField.text ?? ""
        
        logInButton.isEnabled = !emeilText.isEmpty && !passwordText.isEmpty
        signUpButton.isEnabled = !emeilText.isEmpty && !passwordText.isEmpty
        return true
    }
    
    
    @objc func getLogin() -> String {
        if let login = loginField.text {
            return login
        }
        return "no login"
    }
    
    //один метод для двух кнопок FireBase
    @objc private func buttonToProfile(button: UIButton) {
       
        let profileViewController = ProfileViewController()
        let logInspector = LoginInspector()

        guard let login = loginField.text, let password = passwordField.text else {
            
            return
            
        }
        if !checkerService.isValidEmail(login) || !checkerService.isValidPassword(password) {
            showAllert(message: "Ошибка ввода email или пароля (не менее 6 символов)")
            return
        } else {
            switch button {
            case logInButton:
                checkerService.checkCredentials(email: login, password: password) { [weak self] result in
                    switch result {
                    case .success(let user):
                        let loginResult = logInspector.check(login, password)
                        if loginResult {
                            let current = CurrentUserService()
                            ProfileTableHeaderView.userProfile = current.currentUser
                            self?.navigationController?.pushViewController(profileViewController, animated: true)
                        } else {
                            self?.showAllert(message: "Страница пользователя не создана")
                        }
                        print(user)
                    case .failure:
                        self?.showAllert(message: "Подьзователь ещё не зарегистрирован")
                    }
                }
            case signUpButton:
                checkerService.signUp(email: login, password: password) { [weak self] result in
                    switch result {
                    case .success(let user):
                        self?.signUpButton.isEnabled = false
                        print("\(user) зарегистрирован")
                    case .failure:
                        self?.showAllert(message: "Этот пользователь уже зарегистрирован!")
                    }
                }
            default:
                break
            }
        }
        
/*
#if DEBUG
              let test = TestUserService()
              if test.userTest?.login == login {
                  ProfileTableHeaderView.userProfile = test.userTest
                  navigationController?.pushViewController(profileViewController, animated: true)
              }
#else
              let current = CurrentUserService()
              if current.currentUser?.login == login {
                  
                  ProfileTableHeaderView.userProfile = current.currentUser
                  navigationController?.pushViewController(profileViewController, animated: true)
              } else {
                  print("ERROR")
              }
#endif
 */

            
          

      }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollFieldView.contentInset.bottom += keyboardHeight ?? 0.0
        
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollFieldView.contentInset.bottom = 0.0
    }
 
    
    private func setupElements() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        scrollFieldView.translatesAutoresizingMaskIntoConstraints = false
        vkView.translatesAutoresizingMaskIntoConstraints = false
        loginField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        stackViewForFields.translatesAutoresizingMaskIntoConstraints = false
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        
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
           // loginField.heightAnchor.constraint(equalToConstant: 50),
            loginField.widthAnchor.constraint(equalTo: stackViewForFields.widthAnchor),
            loginField.bottomAnchor.constraint(equalTo: spaceView.topAnchor),
            
           
            spaceView.heightAnchor.constraint(equalToConstant: 0.5),
            spaceView.leadingAnchor.constraint(equalTo: stackViewForFields.leadingAnchor),
            spaceView.trailingAnchor.constraint(equalTo: stackViewForFields.trailingAnchor),
            spaceView.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            //spaceView.bottomAnchor.constraint(equalTo: passwordField.topAnchor),
            
        
            passwordField.topAnchor.constraint(equalTo: spaceView.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: stackViewForFields.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: stackViewForFields.trailingAnchor),
            passwordField.widthAnchor.constraint(equalTo: stackViewForFields.widthAnchor),
           // passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.bottomAnchor.constraint(equalTo: stackViewForFields.bottomAnchor),
            
            logInButton.topAnchor.constraint(equalTo: stackViewForFields.bottomAnchor, constant: 30),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.widthAnchor.constraint(equalTo: scrollFieldView.widthAnchor),
            logInButton.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor),
            //logInButton.bottomAnchor.constraint(equalTo: scrollFieldView.bottomAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: scrollFieldView.leadingAnchor),
            signUpButton.trailingAnchor.constraint(equalTo: scrollFieldView.trailingAnchor),
            signUpButton.widthAnchor.constraint(equalTo: scrollFieldView.widthAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: scrollFieldView.bottomAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
       
        ])
        
    }
    
    
}


