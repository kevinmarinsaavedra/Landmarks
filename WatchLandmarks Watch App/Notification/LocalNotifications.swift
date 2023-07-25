//
//  LocalNotifications.swift
//  WatchLandmarks Watch App
//
//  Created by Kevin Marin on 26/7/23.
//

import Foundation
import UserNotifications

final class LocalNotifications: NSObject {
    
    static let categoryIdentifier = "Landmark"
    private let actionIdentifier = "viewLandmarksAction"
    
    override init() {
        super.init()
        
        Task {
            do {
                try await self.register()
                try await self.schedule()
            } catch {
                print("⌚️ local notification: \(error.localizedDescription)")
            }
        }
    }
    
    func register() async throws {
        let current = UNUserNotificationCenter.current()
        try await current.requestAuthorization(options: [.alert, .sound, .badge])

        current.removeAllPendingNotificationRequests()

        let action = UNNotificationAction(
            identifier: self.actionIdentifier,
            title: "See More",
            options: .foreground
        )

        let category = UNNotificationCategory(
            identifier: Self.categoryIdentifier,
            actions: [action],
            intentIdentifiers: []
        )

        current.setNotificationCategories([category])
        current.delegate = self
    }

    func schedule() async throws {
        let timeInterval: Double = 3
        
        let current = UNUserNotificationCenter.current()
        let settings = await current.notificationSettings()
        guard settings.alertSetting == .enabled else { return }

        let content = UNMutableNotificationContent()
        content.title = "Turtle Rock"
        content.subtitle = "Joshua Tree Nation"
        content.body = "You are within 5 miles of Turtle Rock.!"
        content.categoryIdentifier = Self.categoryIdentifier

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: timeInterval,
            repeats: false
        )
        
        let request = UNNotificationRequest(
            identifier: "Landmark",
            content: content,
            trigger: trigger
        )

        try await current.add(request)
    }
}

extension LocalNotifications: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [.list, .sound, .badge]
    }
}


