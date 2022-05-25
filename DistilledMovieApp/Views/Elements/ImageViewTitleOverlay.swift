// File: ImageViewTitleOverlay.swift
// Project: DistilledMovieApp

import SwiftUI

struct ImageViewTitleOverlay: View {
    
    var title: String
    
    var body: some View {
        Text(title)
           .font(.title3)
           .bold()
           .lineLimit(4)
           .frame(width: 120)
           .multilineTextAlignment(.center)
           .blendMode(.overlay)
           .opacity(0.5)
           .padding(.horizontal, 10)
           .unredacted()
    }
}

struct ImageViewTitleOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewTitleOverlay(title: "No Image")
    }
}
