//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Kevin Marin on 5/7/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle("Favorite only", isOn: $showFavoritesOnly)

                ForEach(filteredLandmarks) { landmark in
                    let landmarkBinding = modelData.bindingForLandmark(landmark)

                    NavigationLink(destination: LandmarkDetail(landmark: landmarkBinding)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
