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
        
        private(set) var movies: [Movie] = []
        private(set) var details: [Details] = []
        
        func fetchMovies() async {
            guard let url = URL(string: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/list.json") else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                movies = decodedResponse.movies
            } catch {
                print("Could not load data from server or decode the data")
            }
        }
        
        func fetchDetails(id: Int) async {
            guard let url = URL(string: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/details/\(id).json") else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(Details.self, from: data)
                details.append(decodedResponse)
            } catch {
                print("Could not load data from server or decode the data")
            }
        }
    }
}
