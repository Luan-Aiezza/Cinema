//
//  MovieDetailViewModel.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import Foundation
import Combine

final class MovieDetailViewModel: ObservableObject {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
