//
//  UIViewController+Extension.swift
//  Navigation

import UIKit

extension UIViewController {
    
    func showAllert() {
        let alertViewController = UIAlertController(title: "Ошибка", message: "Попробуйте ещё раз", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertViewController.addAction(action)
        present(alertViewController, animated: true)
    }
    
}
