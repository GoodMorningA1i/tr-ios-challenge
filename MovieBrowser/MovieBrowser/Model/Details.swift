//
//  Details.swift
//  MovieBrowser
//
//  Created by Ali Syed on 2025-09-21.
//

struct Details: Decodable {
    let id: Int
    let name: String
    let description: String
    let notes: String
    let rating: Double
    let picture: String
    let releaseDate: Int
}
