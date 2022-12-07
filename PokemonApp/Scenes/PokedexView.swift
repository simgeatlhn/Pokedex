//
//  PokedexView.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var searchText = ""
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.filteredPokemon) { pokemon  in
                        NavigationLink(destination: DetailView(pokemon: pokemon, viewModel: viewModel), label: {
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                        })
                    }
                }
            }
            .navigationTitle("Pokedex")
            .animation(.linear(duration: 0.3), value: viewModel.filteredPokemon.count)
            .searchable(text: $viewModel.searchText, prompt: "search")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
