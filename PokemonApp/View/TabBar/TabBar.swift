//
//  TabBar.swift
//  PokemonApp
//
//  Created by simge on 6.12.2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            PokedexView()
                .tabItem {
                    Label("Home", systemImage: "homekit")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
