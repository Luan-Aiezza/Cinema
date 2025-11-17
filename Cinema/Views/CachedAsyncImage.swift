//
//  CachedAsyncImage.swift
//  Cinema
//
//  Created by Luan Aiezza on 17/11/25.
//

import SwiftUI

struct CachedAsyncImage: View {
    let url: URL?
    let content: (Image) -> AnyView
    let placeholder: () -> AnyView
    
    @State private var uiImage: UIImage?
    
    var body: some View {
        Group {
            if let uiImage {
                content(Image(uiImage: uiImage))
            } else {
                placeholder()
                    .task {
                        await load()
                    }
            }
        }
    }
    
    private func load() async {
        guard let url else { return }
        
        if let cached = ImageCache.shared.get(forKey: url.absoluteString) {
            self.uiImage = cached
            return
        }
        
        do {
            let image = try await ImageLoader.shared.loadImage(from: url)
            self.uiImage = image
        } catch {
            print("Erro ao carregar imagem:", error)
        }
    }
}
