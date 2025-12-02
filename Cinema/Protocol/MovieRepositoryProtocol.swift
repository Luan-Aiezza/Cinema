//
//  Untitled.swift
//  Cinema
//
//  Created by Luan Aiezza on 02/12/25.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getPopularMovies() async throws -> [Movie]
}
