//
//  FeedViewController.swift
//  Navigation


import UIKit


struct Post {
    var title: String
}


class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    var model = FeedModel()
    
    lazy var postButton: CustomButton = {
        var buttonAction: () -> Void = {
            let postViewController = PostViewController()
            self.navigationController?.pushViewController(postViewController, animated: true)
        }
        let button = CustomButton(title: post.title, titleColor: .systemBlue, action: buttonAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var textField: UITextField = {
        let text = UITextField()
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = UIColor.black
        text.placeholder = " введите текст "
        text.layer.borderWidth = 2
        text.layer.cornerRadius = 12
        text.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.layer.borderColor = UIColor.darkGray.cgColor
        text.layer.backgroundColor = UIColor.white.cgColor
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var checkGuessButton: CustomButton = {
        var actionButton: () -> Void = { [self] in
            guard let word = self.textField.text else { return }
            colorLabel.text = word
            if (self.model.check(word: word) == true) {
                self.colorLabel.textColor = UIColor.green
            } else {
                self.colorLabel.textColor = UIColor.red
            }
        }
        let button = CustomButton(title: "проверка", titleColor: .white, action: actionButton)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "слово"
        label.backgroundColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemCyan

        view.addSubview(postButton)
        view.addSubview(textField)
        view.addSubview(checkGuessButton)
        view.addSubview(colorLabel)
        constraints()
    }
        
    
    func constraints() {
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            postButton.heightAnchor.constraint(equalToConstant: 50),
            postButton.widthAnchor.constraint(equalToConstant: 200),
            
            textField.topAnchor.constraint(equalTo: postButton.bottomAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            checkGuessButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            checkGuessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
           
    
            colorLabel.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 20),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            colorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            colorLabel.heightAnchor.constraint(equalToConstant: 20)
    
            
        ])
        
        
    }
        
        
}
