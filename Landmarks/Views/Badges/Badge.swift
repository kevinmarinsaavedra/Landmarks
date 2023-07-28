//
//  Badge.swift
//  Landmarks
//
//  Created by Kevin Marin on 10/7/23.
//

import SwiftUI

struct Badge: View {
    let numberBadge = 6
    var rangeValues: Range<Int> { 0..<numberBadge }

    var badgeSymbols: some View {
        ForEach(rangeValues,  id: \.self) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(numberBadge)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 3.0, anchor: .bottom)
                    .position(
                        x: geometry.size.width / 2.0,
                        y: 0
                    )
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
           .previewLayout(.fixed(width: 500, height: 500))
    }
}
