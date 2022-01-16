//
//  SimilarMovies.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import Foundation

struct SimilarMovieData: Codable {
    var results: [SimilarMovie]
}

struct SimilarMovie: Hashable, Codable {
    var name: String
    var image: String
    var releaseDate: String
    var genresIds: [Int]
    var genreString: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case image = "poster_path"
        case releaseDate = "release_date"
        case genresIds = "genre_ids"
    }
}
