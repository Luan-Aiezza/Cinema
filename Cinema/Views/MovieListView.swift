//
//  MovieListView.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Carregando…")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text(error)
                        Button("Tentar novamente") {
                            Task { await viewModel.loadMovies() }
                        }
                        .padding(.top)
                    }
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieRowView(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle("Filmes Populares")
            .task {
                await viewModel.loadMovies()
            }
        }
    }
}
