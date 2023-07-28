//
//  Observation.swift
//  Landmarks
//
//  Created by Kevin Marin on 15/7/23.
//

import Foundation

struct Observation: Codable, Hashable {
    var distanceFromStart: Double
    var elevation: Range<Double>
    var pace: Range<Double>
    var heartRate: Range<Double>
}
