//
//  ContentView.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-20.
//

struct Response: Decodable {
    let movies: [Movie]
}

struct Movie: Identifiable, Decodable {
    let id: Int
    let name: String
    let thumbnail: String
    let year: Int
}

import SwiftUI

struct ContentView: View {
    @State private var movies: [Movie] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50) {
                ForEach(movies) { movie in
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
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/list.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            movies = decodedResponse.movies
        } catch {
            print("Could not load data from server or decode the data")
        }
    }
}

#Preview {
    ContentView()
}
