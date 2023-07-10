//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Kevin Marin on 10/7/23.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
           .previewLayout(.fixed(width: 500, height: 500))
    }
}
