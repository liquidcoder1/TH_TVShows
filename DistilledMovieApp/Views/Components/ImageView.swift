// File: ImageView.swift
// Project: DistilledMovieApp

import SwiftUI

struct ImageView: View {
    
    var url: URL?
    var name: String = "No Image"
    private let placeholderImage: String = "imagePlaceholder"
    
    var body: some View {
        AsyncImage(url: url,
                   scale: 1,
                   transaction: Transaction(animation: .easeIn)) { phase in
            switch phase {
            case .empty:
                createPlaceholderView(title: "Loading...")
            case .success(let image):
                image.fitImage()
            case .failure:
                createPlaceholderView(title: name)
            @unknown default:
                createPlaceholderView(title: name)
            }
        }.cornerRadius(10)
    }
    
    private func createPlaceholderView(title: String) -> some View {
        ZStack {
            Image(placeholderImage)
                .fitImage()
                .redacted(reason: .placeholder)
            ImageViewTitleOverlay(title: title)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/YksR65as1ppF2N48TJAh2PLa.jpg") , name: "No Image")
    }
}
