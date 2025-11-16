//
//  Favourites.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-11-16.
//

import SwiftUI

@Observable
class Favourites {
    private var movies: Set<Movie>
    
    init() {
        movies = []
        //load data
        
    }
    
    func contains(_ movie: Movie) -> Bool {
        movies.contains(movie)
    }
    
    func add(_ movie: Movie) {
        movies.insert(movie)
        save()
    }
    
    func remove(_ movie: Movie) {
        movies.remove(movie)
        save()
    }
    
    func save() {
        //write out all data
    }
}
