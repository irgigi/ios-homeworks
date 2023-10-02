//
//  NetworkService.swift
//  Navigation


import UIKit



enum ApiError: Error {
    
    case networkError
    case notFound
    case invalidInput
    
}

final class NetworkService {

    var photosViewController: PhotosViewController

    
    init(photosViewController: PhotosViewController) {
        self.photosViewController = photosViewController
    }
    
    
    func getPhotos(arrayPhotos: [UIImage]) throws {
        if arrayPhotos == photosViewController.photos {
            print("фото загружены")
        } else if arrayPhotos .isEmpty {
            throw ApiError.notFound
        } else if arrayPhotos != photosViewController.photos {
            throw ApiError.invalidInput
        } else {
            throw ApiError.networkError
        }
    }
    
    func chanchedPhoto(array: [UIImage], completion: @escaping (Result<[UIImage], ApiError>) -> Void) {
        if !photosViewController.processedPhotos.isEmpty {
            let array = photosViewController.processedPhotos
            completion(.success(array))
        } else {
            completion(.failure(.invalidInput))
        }
    }
}

