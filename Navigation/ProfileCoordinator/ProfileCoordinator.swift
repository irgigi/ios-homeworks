//
//  ProfileCoordinator.swift
//  Navigation


import UIKit

protocol ProfileCoordinatorProtocol {
    func startPhotos() -> UIViewController
}

final class ProfileCoordinator {
    
    func startPhotos() -> UIViewController {
        
        return PhotosViewController()
    }

}
