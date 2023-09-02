//
//  CustomButton.swift
//  Navigation


import UIKit

class CustomButton: UIButton {
    
    var buttonAction: (() -> Void)?
    
    init(title: String, titleColor: UIColor, action: @escaping () -> Void) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.buttonAction = action
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped() {
        buttonAction?()
    }
}
