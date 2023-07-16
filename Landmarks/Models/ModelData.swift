//
//  ModelData.swift
//  Landmarks
//
//  Created by Kevin Marin on 5/7/23.
//

import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [Category: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category}
        )
    }
    
    func bindingForLandmark(_ landmark: Landmark) -> Binding<Landmark> {
        guard let landmarkIndex = landmarks.firstIndex(where: { $0.id == landmark.id }) else {
            fatalError("Invalid landmark")
        }
        
        return Binding<Landmark>(
            get: { self.landmarks[landmarkIndex] },
            set: { self.landmarks[landmarkIndex] = $0 }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
