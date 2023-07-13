//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Kevin Marin on 13/7/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryRow(category: category, landmarks: $modelData.landmarks)
                }
                .listRowInsets(EdgeInsets())

            }
            .listStyle(PlainListStyle())
            .navigationTitle("Feature")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
