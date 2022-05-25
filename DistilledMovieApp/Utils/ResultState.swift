// File: ResultState.swift
// Project: DistilledMovieApp

import Foundation

enum ResultState<T: Equatable, E: Error>: Equatable {
    
    case loading
    case success(T)
    case failure(E)

    static func == (lhs: ResultState<T, E>, rhs: ResultState<T, E>) -> Bool {
        
        switch lhs {
        case .loading:
            if case loading = rhs {
                return true
            }
        case .success(let lhsValue):
            if case success(let rhsValue) = rhs {
                return rhsValue == lhsValue
            }
            
        case .failure(let lhsError):
            if case failure(let rhsError) = rhs {
                return lhsError.localizedDescription == rhsError.localizedDescription
            }
        }
        
        return false
    }
}
