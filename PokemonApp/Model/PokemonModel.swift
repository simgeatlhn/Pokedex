//
//  PokemonModel.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
}

let MOCK_POKEMON:[Pokemon] = [
    .init(id:1,name:"bulbasaur",imageUrl: "",type: "poison", description: ""),
]
