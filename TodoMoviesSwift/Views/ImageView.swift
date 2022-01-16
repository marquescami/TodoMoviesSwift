//
//  ImageView.swift
//  TodoMoviesSwift
//
//  Created by Camila Marques Vasconcelos Loureiro on 15/01/22.
//

import SwiftUI

struct ImageView: View {
    
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    var body: some View {
        Image(systemName: "").data(url: URL(string: "\(Request.imageURL)\(movieViewModel.movie.image)")!)
            .resizable()
            .scaledToFill()
            .clipped()
            .mask {
                LinearGradient(colors: [.white, .white.opacity(0)], startPoint: .top, endPoint: .bottom)
            }.frame(maxHeight: 380)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
