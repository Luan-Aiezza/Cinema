# Cinema

Cinema is an iOS app built with SwiftUI and MVVM that consumes The Movie Database (TMDB) REST API to list popular movies (in Brazilian Portuguese) and show a detail screen for each one. Posters are loaded through a custom in-memory image cache. It started as a learning and portfolio project on REST consumption, layered architecture and image caching.

## Features

- Popular movies list fetched from the TMDB `movie/popular` endpoint (`language=pt-BR`)
- Movie detail screen with poster, title, overview and average rating
- Networking with `URLSession` and `async/await`
- Custom in-memory image cache (`NSCache`) and a reusable `CachedAsyncImage` view
- Loading state, error message and "try again" button on the list screen
- Navigation with `NavigationStack`
- Repository pattern with protocols (`MovieRepositoryProtocol`, `MovieServiceProtocol`) injected into the view model

## Architecture

The data flow is **View → ViewModel → Repository → Service → TMDB API**.

| Folder | Contents |
| --- | --- |
| `Cinema/Models` | `Movie`, `MovieResponse` (Codable) and `MovieRepository` |
| `Cinema/Protocol` | `MovieRepositoryProtocol`, `MovieServiceProtocol` |
| `Cinema/Services` | `MovieService` (API calls), `ImageLoader`, `ImageCache` |
| `Cinema/ViewModels` | `MovieListViewModel`, `MovieDetailViewModel` |
| `Cinema/Views` | `MovieListView`, `MovieRowView`, `MovieDetailView`, `CachedAsyncImage` |
| `Cinema/CinemaApp.swift` | App entry point (starts at `MovieListView`) |

`ContentView.swift` is the unused Xcode template file.

### Image caching

`ImageLoader` checks `ImageCache` (an `NSCache<NSString, UIImage>` keyed by URL) before downloading, and stores the result afterwards. `CachedAsyncImage` uses it, so revisiting a poster in the same session does not trigger a new request. The cache is memory only, with no disk persistence.

## Tech stack

![Swift](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-0D96F6?style=for-the-badge&logo=swift&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white)
![TMDB](https://img.shields.io/badge/TMDB-01B4E4?style=for-the-badge&logo=themoviedatabase&logoColor=white)

Also used: Combine (`ObservableObject` / `@Published`), Swift Concurrency, `URLSession`, `NSCache`, `Codable`.

## Running the project

Requirements: a Mac with a recent Xcode. The project sets `IPHONEOS_DEPLOYMENT_TARGET = 26.0`, Swift 5 and bundle identifier `Aiezza.Cinema`.

1. Clone the repository:
   ```bash
   git clone https://github.com/Luan-Aiezza/Cinema.git
   cd Cinema
   ```
2. Create a free TMDB API key at https://www.themoviedb.org/ (optional, see the note below).
3. Open `Cinema/Services/MovieService.swift` and set your key in `apiKey`.
4. Open `Cinema.xcodeproj` in Xcode.
5. Select an iPhone or iPad simulator and press Run (Cmd+R).

Note: the repository currently has an API key hardcoded in `MovieService.swift`. Replace it with your own and avoid committing keys.

## Possible improvements

- Disk cache for images
- Pagination
- Unit tests (none exist yet)
- Search and favorites

## Author

Developed by [Luan Aiezza](https://github.com/Luan-Aiezza).
