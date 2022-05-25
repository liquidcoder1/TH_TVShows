// File: TopRatedCell.swift
// Project: DistilledMovieApp

import SwiftUI

struct TopRatedCell: View {
    
    var tvShow: TVShow
    
    var body: some View {
        VStack {
            ImageView(url: tvShow.imageUrl)
            Text(tvShow.displayName)
                .bold()
                .multilineTextAlignment(.center)
                
        }
    }
}

struct TopRatedCell_Previews: PreviewProvider {
    static var previews: some View {
        TopRatedCell(tvShow: TVShow(id: 0, name: "", posterPath: "") )
    }
}
