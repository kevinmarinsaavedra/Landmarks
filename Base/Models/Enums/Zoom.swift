//
//  Zoom.swift
//  Landmarks
//
//  Created by Kevin Marin on 28/7/23.
//

import Foundation

enum Zoom: String, CaseIterable, Identifiable {
    case near = "Near"
    case medium = "Medium"
    case far = "Far"

    var id: Zoom {
        return self
    }
}
