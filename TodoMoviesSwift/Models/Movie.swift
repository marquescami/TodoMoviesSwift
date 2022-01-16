//
//  Movie.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 14/01/22.
//

import Foundation

struct Movie: Codable {
    var name: String
    var image: String
    var numberOfLikes: Int
    var popularity: Double
    var similarMovies: [SimilarMovie] = []
    
    enum CodingKeys: String, CodingKey {
        case name = "original_title"
        case image = "poster_path"
        case numberOfLikes = "vote_count"
        case popularity
    }
    
}
