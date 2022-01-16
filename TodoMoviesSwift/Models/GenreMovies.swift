//
//  GenreMovies.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import Foundation

struct GenreData: Codable {
    var genres: [Genre]
}

struct Genre: Codable {
    var id: Int
    var name: String
}
