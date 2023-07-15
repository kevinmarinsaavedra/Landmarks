//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Kevin Marin on 15/7/23.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button("Cancel", role: .destructive) {
                    draftProfile = modelData.profile
                    editMode?.animation().wrappedValue = .inactive
                }.isHidden(editMode?.wrappedValue == .inactive, remove: true)
                
                Spacer()
                
                EditButton()
            }
                        
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile, recentHike: modelData.hikes[0])
            } else {
                ProfileEditor(profile: $draftProfile)
                .onAppear {
                    draftProfile = modelData.profile
                }
                .onDisappear {
                    modelData.profile = draftProfile
                }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
