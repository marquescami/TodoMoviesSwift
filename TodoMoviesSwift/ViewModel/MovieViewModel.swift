//
//  MovieViewModel.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import Foundation
import Alamofire

class MovieViewModel: ObservableObject {
    
    @Published var movie = Movie(name: "", image: "", numberOfLikes: 0, popularity: 0, similarMovies: [])
    
    func getMovieDetails()  {
        let getDetailsMovieRequest = Request.makeRequest(request: .movieDetails)
        
        getDetailsMovieRequest.responseDecodable(of: Movie.self) { response in
            guard let data = response.value else { return }
            self.movie = data
        }
        
        let getGenres = Request.makeRequest(request: .genresMovies)
        var genres: [Genre] = []
        getGenres.responseDecodable(of: GenreData.self) { response in
            guard let data = response.value else { return }
            genres = data.genres
        }
        
        let getSimilariesMovies = Request.makeRequest(request: .similarMovies)
        
        getSimilariesMovies.responseDecodable(of: SimilarMovieData.self) { response in
            
            guard let data = response.value else { return }
            
            for similarMovies in 0..<data.results.count {
                self.movie.similarMovies.append(data.results[similarMovies])
                
                let map: [String] = data.results[similarMovies].genresIds.map { id -> String in
                    
                    for genre in genres {
                        if id == genre.id {
                            return genre.name
                        }
                    }
                    return ""
                }
                
                self.movie.similarMovies[similarMovies].genreString = map
            }
        }
    }
    
    func convertStringInDataFormatAndReturnYear(_ similarMovie: SimilarMovie) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        let date = dateFormatter.date(from: similarMovie.releaseDate)
        
        let calendarDate = Calendar.current.dateComponents([.year], from: date!)
        return String(calendarDate.year!)
    }
}

