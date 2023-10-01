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
    
    let photos = PhotosViewController().processedPhotos
    
    func getPhotos(arrayPhotos: [UIImage]) throws {
        if arrayPhotos == photos {
            print("фото загружены")
        } else if arrayPhotos .isEmpty {
            throw ApiError.notFound
        } else if arrayPhotos != photos {
            throw ApiError.invalidInput
        } else {
            throw ApiError.networkError
        }
    }
}
