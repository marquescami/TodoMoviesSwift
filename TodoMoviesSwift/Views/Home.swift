//
//  Home.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var movieViewModel = MovieViewModel()
    
    init() {
        movieViewModel.getMovieDetails()
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    
                    ImageView()
                    
                    DescriptionView()
                    
                    SimilarView().padding()
                    
                }.foregroundColor(.white)
            }.edgesIgnoringSafeArea(.top)
                .environmentObject(movieViewModel)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


