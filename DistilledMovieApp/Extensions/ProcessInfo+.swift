// File: ProcessInfo+.swift
// Project: DistilledMovieApp

import Foundation

extension ProcessInfo {
    var isTesting: Bool {
        arguments.contains(Constants.testingFlag)
    }
}

