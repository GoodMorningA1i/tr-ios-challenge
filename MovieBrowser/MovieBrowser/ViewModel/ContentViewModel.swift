//
//  ContentViewModel.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-20.
//

import Foundation

extension ContentView {
    @Observable @MainActor
    class ViewModel {
        
        private(set) var movies: [Int: Movie] = [:]
        
        func fetchMovies() async {
            await fetchList()
            await fetchDetails()
        }
        
        func fetchList() async {
            guard let url = URL(string: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/list.json") else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                                
                for movie in decodedResponse.movies {
                    //Assuming you can't have duplicate ids
                    movies[movie.id] = movie
                }
            } catch {
                print("Could not load data from server or decode the data")
            }
        }
        
        func fetchDetails() async {
            for id in movies.keys {
                guard let url = URL(string: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/details/\(id).json") else {
                    print("Invalid URL")
                    return
                }
                
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let decodedResponse = try JSONDecoder().decode(Movie.self, from: data)
                    movies[id]?.Description = decodedResponse.Description
                } catch {
                    print("Could not load data from server or decode the data")
                }
            }
        }
        
    }
}
