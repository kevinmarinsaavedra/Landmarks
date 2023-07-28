//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Kevin Marin on 5/7/23.
//

import SwiftUI
import PushKit

@main
struct LandmarksApp: App {
    
    #if os(watchOS)
    private let local = LocalNotifications()
    #endif

    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(
            controller: NotificationController.self,
            category: "LandmarkNear"
        )
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
