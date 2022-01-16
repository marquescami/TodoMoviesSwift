//
//  SimilarView.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import SwiftUI

struct SimilarView: View {
    
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    var body: some View {
        ForEach(movieViewModel.movie.similarMovies, id: \.self) { similarMovies in
            SimilarDetailsView(similarMovie: similarMovies)
        }
    }
}

struct SimilarDetailsView: View {
    
    @EnvironmentObject var movieViewModel: MovieViewModel
    var similarMovie: SimilarMovie
    
    var body: some View {
        HStack {
            Image(systemName: "").data(url: URL(string: "\(Request.imageURL)\(similarMovie.image)")!)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 88, idealHeight: 120)
                .clipped()
            VStack(alignment: .leading, spacing: 4) {
                Text(similarMovie.name)
                    .font(.title3)
                    .bold()
                HStack(spacing: 0) {
                    Text("\(movieViewModel.convertStringInDataFormatAndReturnYear(similarMovie))  -")
                        .padding(.trailing, 8)
                    HStack(spacing: 0) {
                        if similarMovie.genreString.count < 2 {
                            Text("\(similarMovie.genreString[0])")
                        } else {
                            Text("\(similarMovie.genreString[0]), ")
                            Text(similarMovie.genreString[1])
                        }
                    }
                }
                .foregroundColor(.white.opacity(0.7))
            }.padding(.leading)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .offset(y: -50)
        }
    }
    
}

struct SimilarView_Previews: PreviewProvider {
    static var previews: some View {
        let movieViewModel = MovieViewModel()
        SimilarView().environmentObject(movieViewModel)
    }
}
