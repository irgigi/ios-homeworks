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
    
    var images = PhotosViewController().photos
    
    func getPhotos(arrayPhotos: [UIImage]) throws {
        if arrayPhotos == images {
            print("фото загружены")
        } else if arrayPhotos .isEmpty {
            print(type(of: images))
            throw ApiError.notFound
        } else if arrayPhotos != images {
            throw ApiError.invalidInput
        } else {
            throw ApiError.networkError
        }
    }
}

