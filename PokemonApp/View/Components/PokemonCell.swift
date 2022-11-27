//
//  PokemonCell.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import SwiftUI

struct PokemonCell: View {
    //let pokemon: Pokemon //Model
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
                Text("Bulbasaur")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                
                HStack {
                    Text("poison")
                        .foregroundColor(.white)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay (
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white.opacity(0.24))
                        )
                        .frame(width:100 , height:24)
                    
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 72,height: 72)
                        .padding([.bottom , .trailing], 4)
                }
            }
            .background(.red)
            .cornerRadius(16)
            .shadow(color: .red, radius: 6, x:0.0, y:0.0)
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell()
    }
}
