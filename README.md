# Cinema

Cinema is an iOS application built with **SwiftUI**, **MVVM architecture**, and **async/await networking**.  
It consumes the RESTful API from *The Movie Database (TMDB)* to display popular movies, detail pages, and cached images.

This project was created as a learning and portfolio piece to demonstrate REST API consumption, clean architecture, and performance-focused image caching.

---

## Features

- Fetch popular movies using a RESTful API  
- SwiftUI interface built with MVVM  
- Async network calls using `URLSession` + `async/await`  
- Custom **in-memory image cache** using `NSCache`  
- Reusable `CachedAsyncImage` view (similar to Apple’s AsyncImage, but with caching)  
- Navigation using `NavigationStack`  
- Loading and error states  
- Reusable, modular structure

---

## Project Structure

Cinema/
│
├── Models/
│ ├── Movie.swift
│ └── MovieResponse.swift
│
├── Services/
│ ├── MovieService.swift
│ ├── ImageCache.swift
│ └── ImageLoader.swift
│
├── ViewModels/
│ ├── MovieListViewModel.swift
│ └── MovieDetailViewModel.swift
│
├── Views/
│ ├── MovieListView.swift
│ ├── MovieRowView.swift
│ ├── MovieDetailView.swift
│ └── CachedAsyncImage.swift
│
└── CinemaApp.swift
└── ContentView.swift

The project follows a clean MVVM approach:  
**Model → Service → ViewModel → View**

---

## Setup

1. Get an API key from TMDB:  
   https://www.themoviedb.org/

2. Open `MovieService.swift`

3. Replace:

```swift
private let apiKey = "YOUR_API_KEY_HERE"
Run the project on iOS 17+
How Image Caching Works
The app includes a custom implementation of image caching:
NSCache stores downloaded images in memory
ImageLoader checks the cache before downloading
CachedAsyncImage loads the image once and reuses it in any view
Returning to a previous view no longer triggers new HTTP requests
This improves performance and makes the UI feel instantly responsive.
Technologies Used
SwiftUI
Swift Concurrency (async/await)
URLSession
MVVM Architecture
NSCache (Image caching)
NavigationStack
Codable
Screenshots (optional)
(Add your screenshots here)
Example:

Screenshots/
│── movie-list.png
│── movie-details.png
Possible Future Improvements
Disk cache for images
Pagination / infinite scrolling
Unit tests for service layer
Search screen
Favorites using CoreData
Skeleton loading placeholders
iPadOS layout improvements
Author
Developed by Luan Aiezza
Feel free to reach out!
GitHub: [https://github.com/Luan-Aiezza](https://github.com/Luan-Aiezza)
LinkedIn: [https://linkedin.com/in/luan-aiezza](https://www.linkedin.com/in/luan-aiezza/)
