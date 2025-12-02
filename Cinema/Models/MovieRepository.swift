//
//  MovieRepository.swift
//  Cinema
//
//  Created by Luan Aiezza on 02/12/25.
//

import Foundation

final class MovieRepository: MovieRepositoryProtocol {
    
    private let service: MovieServiceProtocol
    
    init(service: MovieServiceProtocol = MovieService()) {
        self.service = service
    }
    
    func getPopularMovies() async throws -> [Movie] {
        try await service.fetchPopularMovies()
    }
}
