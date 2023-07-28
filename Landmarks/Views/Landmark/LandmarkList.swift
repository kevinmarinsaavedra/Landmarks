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
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?

    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    private var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    private var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark) {
                Toggle("Favorite only", isOn: $showFavoritesOnly)

                ForEach(filteredLandmarks) { landmark in
                    let landmarkBinding = modelData.bindingForLandmark(landmark)

                    NavigationLink(destination: LandmarkDetail(landmark: landmarkBinding)) {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .scrollIndicators(.hidden)
            .frame(minWidth: 300)
            .navigationTitle(title)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
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
