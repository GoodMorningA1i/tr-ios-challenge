//
//  Movie.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-20.
//

struct Movie: Identifiable, Decodable {
    let id: Int
    let name: String
    let thumbnail: String
    let year: Int
}
