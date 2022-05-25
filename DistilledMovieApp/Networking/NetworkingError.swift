// File: NetworkingError.swift
// Project: DistilledMovieApp

import Foundation

enum NetworkingError: Error {
    
    case NotAuthenticated
    case Forbidden
    case NotFound
    case BadRequest
    case Unauthorized
    case RequestTimeout
    case BadResponse(HTTPURLResponse?)
    case NetworkProblem(URLError)
    
    init(_ error:URLError){
        self = .NetworkProblem(error)
    }
    
    init(_ response:URLResponse?) {
        guard let response = response as? HTTPURLResponse else {
            self = .BadResponse(nil)
            return
        }
        
        switch response.statusCode {
        case 400: self = .BadRequest
        case 401: self = .Unauthorized
        case 403: self = .Forbidden
        case 404: self = .NotFound
        case 408: self = .RequestTimeout
        default:
            self = .BadResponse(response)
        }
    }
}

extension NetworkingError: CustomStringConvertible {
    public var description: String {
        switch self {
            
        case .NotAuthenticated:
            return "Not Authenticated"
        case .Forbidden:
            return "Forbidden"
        case .NotFound:
            return "Not Found"
        case .BadRequest:
            return "Bad Request"
        case .Unauthorized:
            return "Unauthorized"
        case .RequestTimeout:
            return "RequestTimeout"
        case .BadResponse(let response):
            return "Undocumented bad response with status code \(response?.statusCode ?? 0): \(response.debugDescription)"
        case .NetworkProblem(let error):
            return "Network problem with error: \(error.localizedDescription)"
        }
    }
}
