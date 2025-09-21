//
//  Movie.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-20.
//

struct Movie: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let thumbnail: String?
    let year: Int?
    
    //Details
    var Description: String?
    var Notes: String?
    var Rating: Double?
    var picture: String?
    var releaseDate: Int?
    
    //Recommendations, list of movie IDs
    var recommendedMovies: [Int]?
}
