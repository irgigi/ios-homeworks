//
//  ProfileViewModel.swift
//  Navigation

import UIKit

final class ProfileViewModel {
    
    private var profiles: [Profile]
    
    init () {
        self.profiles = Profile.make()
    }
    
    func numberOfProfiles () -> Int {
        return profiles.count
    }
    
    func profile(at index: Int) -> Profile {
        return profiles[index]
    }
    
    
}

