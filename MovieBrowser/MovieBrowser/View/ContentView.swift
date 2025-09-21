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
        ScrollView {
            VStack(spacing: 50) {
                ForEach(viewModel.movies) { movie in
                    AsyncImage(url: URL(string: movie.thumbnail)) { phase in
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
                }
            }
            .padding()
            .task {
                await viewModel.fetchMovies()
            }
        }
    }
}

#Preview {
    ContentView()
}
