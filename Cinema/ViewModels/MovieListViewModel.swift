//
//  MovieListViewModel.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import Foundation
import Combine

@MainActor
final class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let repository: MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol = MovieRepository()) {
        self.repository = repository
    }
    
    func loadMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            movies = try await repository.getPopularMovies()
        } catch {
            errorMessage = "Não foi possível carregar os filmes."
            print(error)
        }
        
        isLoading = false
    }
}

