//
//  MovieRowView.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 16) {
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
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                
                Text(movie.overview)
                    .lineLimit(3)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", movie.voteAverage))
                }
                .font(.caption)
            }
        }
    }
}
