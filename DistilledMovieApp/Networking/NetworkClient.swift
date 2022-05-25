// File: NetworkClient.swift
// Project: DistilledMovieApp

import Foundation
import Combine

struct NetworkClient {
    
    private let session: URLSession
    
    init(_ session: URLSession) {
        self.session = session
    }
    
    func get(_ url: URL) -> AnyPublisher<Data, URLError> {
        return session
            .dataTaskPublisher(for: url)
            .retry(3)
            .map(\.data)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension NetworkClient {
    
    static var shared: NetworkClient {
        let config = URLSessionConfiguration.default
        config.urlCache = URLCache.shared
        config.waitsForConnectivity = true
        config.requestCachePolicy = .reloadIgnoringCacheData
        return NetworkClient(URLSession(configuration: config))
    }
    
    static var test: NetworkClient {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        return NetworkClient(session)
    }
}
