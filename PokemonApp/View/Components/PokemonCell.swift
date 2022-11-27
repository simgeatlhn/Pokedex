//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon: Pokemon //Model -> PokedoxView
    let viewModel: PokemonViewModel //funcbackgroundColor
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type)
                        .foregroundColor(.white)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay (
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white.opacity(0.24))
                        )
                        .frame(width:100 , height:24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72,height: 72)
                        .padding([.bottom , .trailing], 4)
                }
            }
            .background(.gray)
            .cornerRadius(16)
            .shadow(color: .black, radius: 6, x:0.0, y:0.0)
        }
    }
}

