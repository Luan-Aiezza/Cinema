//
//  ImageLoader.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import UIKit

final class ImageLoader {
    static let shared = ImageLoader()
    private init() {}
    
    func loadImage(from url: URL) async throws -> UIImage {
        
        // 1. Verifica se já existe no cache
        if let cached = ImageCache.shared.get(forKey: url.absoluteString) {
            return cached
        }
        
        // 2. Baixa da internet
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let image = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        
        // 3. Armazena no cache
        ImageCache.shared.set(image, forKey: url.absoluteString)
        
        return image
    }
}
