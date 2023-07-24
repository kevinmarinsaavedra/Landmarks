//
//  PageView.swift
//  Landmarks
//
//  Created by Kevin Marin on 18/7/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 20))
                .padding(.trailing, 10).padding(.bottom, 10)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        let pages = ModelData().features.map {
            FeatureCard(landmark: $0)
        }
        
        PageView(pages: pages)
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
