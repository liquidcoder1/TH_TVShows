// File: JsonDecoder.swift
// Project: DistilledMovieApp

import Foundation

public let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
  return decoder
}()
