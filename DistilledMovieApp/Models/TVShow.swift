// File: TVShow.swift
// Project: DistilledMovieApp

import Foundation
import SwiftUI


struct TVShow: Codable, Identifiable, Equatable {
    let id:Int
    let name:String?
    let posterPath:String?
}

struct TVShowResult:Codable {
    let page:Int
    let totalPages:Int
    let results:[TVShow]

    static var placeholder: TVShowResult {
        Bundle.main.decode(TVShowResult.self, from: "tvs.json")

    }
}

extension TVShow {
    
    var displayName: String {
        self.name ?? "No name"
    }
    
    var imageUrl: URL? {
        URLBuilder.imageUrl(self.posterPath ?? "")
    }
}
