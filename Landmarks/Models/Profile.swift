//
//  Profile.swift
//  Landmarks
//
//  Created by Kevin Marin on 15/7/23.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
}
