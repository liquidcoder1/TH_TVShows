// File: TVViewModel.swift
// Project: DistilledMovieApp

import Foundation
import Combine

typealias TVShowResponse = ((Result<[TVShow], NetworkingError>) -> Void)

class TVShowViewModel: ObservableObject {
    
    private var service: TVShowService
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var tvShowsResultState = ResultState<[TVShow], NetworkingError>.loading
    
    init(_ service: TVShowService = ProcessInfo.processInfo.isTesting ? .testing : .live) {
        self.service =  service
    }
    
    func loadPage(_ pageNumber: Int) {
        fetchTvShows(pageNumber: pageNumber,
                     response: { [weak self] result in
            switch result {
            case .success(let shows):
                self?.tvShowsResultState = .success(shows)
            case .failure(let error):
                Log.error(error)
                self?.tvShowsResultState = .failure(error)
            }
        })
    }
    
    func sortShows() {
        if case .success(let shows) = tvShowsResultState {
            self.tvShowsResultState = .success(
                shows.sorted(by: { $0.displayName < $1.displayName })
            )
        }
    }
    
    func fetchTvShows(pageNumber: Int, response: @escaping TVShowResponse) {
        
        let url = URLBuilder.topRated(page: .page(pageNumber))
        
        service.tvShows(url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    Log.info("Finished successfully")
                case .failure(let error):
                    Log.error(error)
                    response(Result.failure(error))
                }
            } receiveValue: { tvShows in
                response(Result.success(tvShows.results))
            }.store(in: &subscriptions)
        
    }
}
