//
//  ContentView.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-20.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel()
    @State private var favourites = Favourites()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(viewModel.movies.values), id: \.self) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        HStack {
                            Text(movie.name)
                            Spacer()
                            if favourites.contains(movie) {
                                Image(systemName: "heart.fill")
                            }
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
        .environment(favourites)
        
    }
}

#Preview {
    ContentView()
}
