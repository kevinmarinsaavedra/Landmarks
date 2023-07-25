//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by Kevin Marin on 25/7/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @Binding var landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFill()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)

                Toggle(isOn: $landmark.isFavorite) {
                    Text("Favorite")
                }

                Divider()

                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)

                Text(landmark.state)
                    .font(.caption)
                
                Divider()

                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(15)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        
        return Group {
            LandmarkDetail(landmark: Binding.constant(modelData.landmarks[0]))
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")
                .environmentObject(ModelData())

            LandmarkDetail(landmark: Binding.constant(modelData.landmarks[0]))
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
                .environmentObject(ModelData())
        }
    }
}
