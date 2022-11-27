//
//  PokedexView.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())] //only two items in row
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(0..<100) { _ in
                        PokemonCell()
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}


struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
