//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Kevin Marin on 15/7/23.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    var recentHike: Hike?
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "on" : "off")")
                Text("Seasons Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack (alignment: .leading) {
                    Text("Completed badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                    }
                }
                
                if let recentHike = recentHike {
                    Divider()
                    
                    VStack (alignment: .leading) {
                        Text("Recent Hikes")
                            .font(.headline)

                        HikeView(hike: recentHike)
                    }
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default, recentHike: ModelData().hikes[0])
            .environmentObject(ModelData())
    }
}
