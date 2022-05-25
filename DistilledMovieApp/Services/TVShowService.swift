// File: TVService.swift
// Project: DistilledMovieApp

import Foundation
import Combine

struct TVShowService {
    var tvShows: (URL) -> AnyPublisher<TVShowResult, NetworkingError>
}

extension TVShowService {
    
    static var live = TVShowService (
        tvShows: { url in
            return NetworkClient.shared.get(url)
                .decode(type: TVShowResult.self, decoder: jsonDecoder)
                .mapError(NetworkingError.init)
                .eraseToAnyPublisher()
        }
    )
    
    static var testing = TVShowService (
        tvShows: { url in
            
            let data = Bundle.main.read(from: "tvs.json")
            
            MockURLProtocol.requestHandler = { request in
                return (HTTPURLResponse(), data)
            }
            
            return NetworkClient.test.get(url)
                .decode(type: TVShowResult.self, decoder: jsonDecoder)
                .mapError(NetworkingError.init)
                .eraseToAnyPublisher()
        }
    )
}
