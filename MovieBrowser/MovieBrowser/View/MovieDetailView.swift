//
//  MovieDetailView.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-30.
//

import SwiftUI

struct MovieDetailView: View {
    private var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        Text(movie.Description ?? "No description")
            .padding()
    }
}

#Preview {
    MovieDetailView(movie: Movie(id: 1, name: "John Wick", thumbnail: nil, year: nil))
}
