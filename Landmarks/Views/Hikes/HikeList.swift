//
//  HikesList.swift
//  Landmarks
//
//  Created by Kevin Marin on 16/7/23.
//

import SwiftUI

struct HikesList: View {
    let hikes: [Hike]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(hikes, id: \.self) { hike in
                    HikeView(hike: hike)
                }
            }
        }
    }
}

struct HikesList_Previews: PreviewProvider {
    static var previews: some View {
        HikesList(hikes: ModelData().hikes)
    }
}
