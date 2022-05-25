// File: TopRatedContent.swift
// Project: DistilledMovieApp

import SwiftUI

struct TopRatedContent: View {
    
    var shows: [TVShow]
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 20, alignment: .top), count: 2)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(shows, content: TopRatedCell.init(tvShow:))
            }.padding(.horizontal)
        }
    }
}

struct TopRatedContent_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedContent(shows:  [])
    }
}
