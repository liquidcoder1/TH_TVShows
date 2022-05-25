// File: URLBuilder.swift
// Project: DistilledMovieApp

import Foundation

enum QueryKeys:String{
    case apiKey="api_key"
    case language="language"
    case page="page"
    case query = "query"
}

enum Language:String {
    case none = ""
    case en_us = "en-US"
}

class URLBuilder {
    
    let API_KEY = "25a8f80ba018b52efb64f05140f6b43c"
    let API_SCHEME = "https"
    let API_HOST = "api.themoviedb.org"
    let IMAGE_HOST = "image.tmdb.org"
    let API_PATH = "/3"
    let IMAGE_PATHS = "/t/p"
    
    enum PathExtension: String {
        case tv="tv"
        case topRated = "top_rated"
        case image500W = "w500"
    }
    
    enum QueryParameter {
                
        case apiKey(String)
        case language(String)
        case page(Int)
        
        func toTuple() -> (String, String) {
            switch self {
            case .apiKey(let value):
                return (QueryKeys.apiKey.rawValue, "\(value)")
            case .language(let value):
                return (QueryKeys.language.rawValue, "\(value)")
            case .page(let value):
                return (QueryKeys.page.rawValue, "\(value)")
            }
        }
    }
    
    private var components: URLComponents
    
    init(isImage: Bool = false) {
        components = URLComponents()
        components.scheme = API_SCHEME
        components.host = isImage ? IMAGE_HOST : API_HOST
        components.path = isImage ? IMAGE_PATHS : API_PATH
        components.queryItems = isImage ? [URLQueryItem]() : [
            URLQueryItem(name: QueryKeys.apiKey.rawValue, value: API_KEY)
        ]
    }
    
    @discardableResult
    func append(_ path: PathExtension) -> URLBuilder {
        self.components.path = components.path.appending("/\(path.rawValue)")
        return self
    }
    
    @discardableResult
    func append(_ pathString: String) -> URLBuilder {
        self.components.path = components.path.appending("/\(pathString)")
        return self
    }
    
    @discardableResult
    func append(_ query: QueryParameter) -> URLBuilder {
        let value = query.toTuple()
        let queryItem = URLQueryItem(name: value.0, value: "\(value.1)")
        components.queryItems!.append(queryItem)
        return self
    }
    
    @discardableResult
    func build() -> URL {
       self.components.url!
    }

    
}

extension URLBuilder {
    
    static func topRated(language: QueryParameter = .language(Language.en_us.rawValue) ,
                         page: QueryParameter = .page(1)) -> URL {
        
        URLBuilder()
            .append(.tv)
            .append(.topRated)
            .append(language)
            .append(page)
            .build()
    }
    
    static func imageUrl(_ path: String) -> URL {
        URLBuilder(isImage: true)
            .append(.image500W)
            .append(path)
            .build()
            
    }
}
