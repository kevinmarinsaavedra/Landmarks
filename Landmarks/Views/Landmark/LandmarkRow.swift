//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Kevin Marin on 5/7/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5.0)

            Text(landmark.name)

            Spacer()

            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .isHidden(!landmark.isFavorite)
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
