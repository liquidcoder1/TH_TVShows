// File: ContentView.swift
// Project: DistilledMovieApp

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModel: TVShowViewModel
    
    var body: some View {
        NavigationView {
            Group {
                switch viewModel.tvShowsResultState {
                case .loading:
                    ProgressView("Fetching data, please wait...")
                        .padding()
                case .success(let shows):
                    TopRatedContent(shows: shows)
                case .failure(let error):
                    ErrorView(message: error.description)
                }
            }.navigationTitle("Top Rated")
            .navigationBarButton("sortButton", action: {
                viewModel.sortShows()
            }, label: {
                Image(systemName: "arrow.up.arrow.down")
                    .foregroundColor(Color.foreground)
            }).onAppear {
                viewModel.loadPage(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(viewModel: TVShowViewModel())
    }
}
