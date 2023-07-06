//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Kevin Marin on 5/7/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
