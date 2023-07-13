//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Kevin Marin on 13/7/23.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .resizable()
                .frame(width: 155.0, height: 155.0)
                .cornerRadius(5.0)
            
            Text("\(landmark.name)")
                .font(.caption)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
