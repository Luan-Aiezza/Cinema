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
    
    private let service = MovieService()
    
    func loadMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            movies = try await service.fetchPopularMovies()
        } catch {
            errorMessage = "Não foi possível carregar os filmes."
            print(error)
        }
        
        isLoading = false
    }
}
