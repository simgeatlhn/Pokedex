//
//  DetailView.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    var pokemon: Pokemon
    @ObservedObject var viewModel = PokemonViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .frame(width: 200, height: 200)
                VStack(alignment: .center, spacing: 16) {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(pokemon.type)
                        .foregroundColor(.orange)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.orange.opacity(0.24))
                        )
                        .frame(width: 100, height: 24)
                    Divider()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(pokemon.description)
                            .foregroundColor(.secondary)

                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .background(Color(red: 243/255, green: 239/255, blue: 224/255))
    }
}
