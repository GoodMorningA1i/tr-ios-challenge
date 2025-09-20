//
//  ContentView.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-20.
//

struct Movies: Decodable {
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
    @State private var thumbnail: String = ""
    
    var body: some View {
        VStack {
            Text("\(thumbnail)")
                .task {
                    await fetchData()
                }
        }
        .padding()
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master/list.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(Movies.self, from: data)
            thumbnail = decoded.movies[0].thumbnail
        } catch {
            print("Could not load data from server or decode the data")
        }
    }
}

#Preview {
    ContentView()
}
