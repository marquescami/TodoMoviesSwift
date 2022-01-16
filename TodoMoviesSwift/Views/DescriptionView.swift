//
//  DescriptionView.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import SwiftUI

struct DescriptionView: View {
    
    @EnvironmentObject var movieViewModel: MovieViewModel
    @State private var heartFilled: Bool = false
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(movieViewModel.movie.name)
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                HStack {
                    HStack {
                        Image(systemName: "suit.heart.fill")
                        Text("\(movieViewModel.movie.numberOfLikes) likes")
                            .padding(.trailing, 32)
                    }
                    HStack {
                        Image(systemName: "heart.rectangle.fill")
                        Text(String(format: "%.3lf", movieViewModel.movie.popularity))
                        Text("views")
                    }
                }
            }
            Spacer()
            Button {
                self.heartFilled.toggle()
            } label: {
                Image(systemName: heartFilled ? "suit.heart.fill" : "suit.heart")
            }
            .offset(y: 24)
        }.padding()
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
