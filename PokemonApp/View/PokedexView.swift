//
//  PokedexView.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())] //only two items in row
    
    @State private var searchText = ""
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemon) { pokemon  in
                        NavigationLink(destination:  DetailView(pokemon: pokemon), label: {
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                        })
                    }
                }
            }
            .searchable(text: $searchText, prompt: "search")
            .navigationTitle("Pokemon")
        }
    }
}


struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
