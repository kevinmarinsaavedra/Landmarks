//
//  Animate+Extension.swift
//  Landmarks
//
//  Created by Kevin Marin on 28/7/23.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2.0)
            .delay(0.05 * Double(index))
    }
}
