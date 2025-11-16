//
//  MovieDetailView.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-30.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(Favourites.self) var favourites
    
    private var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        Text(movie.Description ?? "No description")
            .padding()
        
        List {
            ForEach(movie.recommendedMovies ?? [], id: \.self) { recommendedMovie in
                Text(recommendedMovie.name)
            }
        }
        
        Button(favourites.contains(movie) ?"Remove from Favourites" : "Add to Favourites") {
            if favourites.contains(movie) {
                favourites.remove(movie)
            } else {
                favourites.add(movie)
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(id: 1, name: "John Wick", thumbnail: nil, year: nil))
        .environment(Favourites())
}
