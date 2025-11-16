//
//  ContentView.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-20.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(Array(viewModel.movies.values)) { movie in
                NavigationLink(movie.name) {
                    MovieDetailView(movie: movie)
                }
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

#Preview {
    ContentView()
}
