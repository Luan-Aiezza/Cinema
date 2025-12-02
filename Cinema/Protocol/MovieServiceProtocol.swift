//
//  MovieServiceProtocol.swift
//  Cinema
//
//  Created by Luan Aiezza on 02/12/25.
//

protocol MovieServiceProtocol {
    func fetchPopularMovies() async throws -> [Movie]
}
