// File: DistilledMovieAppApp.swift
// Project: DistilledMovieApp

import SwiftUI

@main
struct DistilledMovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen(viewModel: TVShowViewModel())
        }
    }
}
