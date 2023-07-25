//
//  Season.swift
//  Landmarks
//
//  Created by Kevin Marin on 15/7/23.
//

import Foundation

enum Season: String, CaseIterable, Identifiable {
    case spring = "🌷"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"

    var id: String { rawValue }
}
