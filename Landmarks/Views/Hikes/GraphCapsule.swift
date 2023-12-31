/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single line in the graph.
*/

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var color: Color
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>

    private var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }

    private var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
            .colorMultiply(color)
    }
}

struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        // The graph that uses the capsule tints it by multiplying against its
        // base color of white. Emulate that behavior here in the preview.
        GraphCapsule(index: 0, color: .blue, height: 150, range: 10..<50, overallRange: 0..<100)
    }
}
