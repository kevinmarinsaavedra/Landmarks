//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Kevin Marin on 13/7/23.
//

import SwiftUI

struct CategoryRow: View {
    @EnvironmentObject private var modelData: ModelData
    var category: Category
    @Binding var landmarks: [Landmark]
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (landmark.category == category)
        }
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(category.rawValue)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    
                    ForEach(filteredLandmarks.indices, id: \.self) { index in
                        let landmark = filteredLandmarks[index]
                        let landmarkBinding = modelData.bindingForLandmark(landmark)
                        
                        NavigationLink(destination: LandmarkDetail(landmark: landmarkBinding)) {
                            
                            CategoryItem(landmark: landmark)
                                .padding(.leading, index == 0 ? 15 : 0)
                                .padding(.trailing, index == filteredLandmarks.count - 1 ? 15 : 0)
                        }
                    }
                }
            }
            .padding(.vertical, 5)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let categoryDefault: Category = .rivers
        let items: [Landmark] = ModelData().categories[categoryDefault] ?? []
        
        CategoryRow(category: categoryDefault, landmarks: Binding.constant(items))
            .environmentObject(ModelData())
    }
}
