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
            ScrollView {
                ForEach(Array(viewModel.movies.values), id: \.self) { movie in
                    NavigationLink(value: movie) {
                        HStack {
                            AsyncImage(url: URL(string: movie.thumbnail ?? "")) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                } else if phase.error != nil {
                                    Text("An error occured loading the image")
                                } else {
                                    ProgressView()
                                }
                            }
                            Spacer()
                            if favourites.contains(movie) {
                                Image(systemName: "heart.fill")
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
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
