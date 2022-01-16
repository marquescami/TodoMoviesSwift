//
//  Request.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import Foundation
import Alamofire

private let apiKey = "1d3541498be4b5e6126c695a2fe109aa"

enum RequestCallsAPI {
    case movieDetails, similarMovies, genresMovies
}

struct Request {
    
    static let imageURL = "https://image.tmdb.org/t/p/original/"
    static func makeRequest(request: RequestCallsAPI) -> DataRequest {
        var AFRequest: DataRequest
        
        switch request {
        case .movieDetails:
            AFRequest = AF.request("https://api.themoviedb.org/3/movie/1930?api_key=\(apiKey)&language=en-US&page=1rl")
        case .similarMovies:
            AFRequest = AF.request("https://api.themoviedb.org/3/movie/1930/similar?api_key=\(apiKey)&language=en-US&page=1")
        case .genresMovies:
            AFRequest = AF.request("https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US/genres")
        }
        return AFRequest
    }
}


