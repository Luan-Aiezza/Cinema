//
//  MovieDetailView.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                CachedAsyncImage(
                    url: movie.posterURL,
                    content: { image in
                        AnyView(
                            image
                                .resizable()
                                .scaledToFill()
                        )
                    },
                    placeholder: {
                        AnyView(
                            Color.gray.opacity(0.3)
                        )
                    }
                )
                .frame(width: 80, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(movie.title)
                    .font(.title)
                    .bold()
                
                Text(movie.overview)
                    .font(.body)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("Nota: \(String(format: "%.1f", movie.voteAverage))")
                }
                .font(.headline)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}
