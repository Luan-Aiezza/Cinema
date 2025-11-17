//
//  MovieService.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import Foundation

final class MovieService {
    private let apiKey = "a3182a0920e23fd86b766ccf9ca710cd"
    
    func fetchPopularMovies() async throws -> [Movie] {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=pt-BR"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(MovieResponse.self, from: data).results
    }
}
