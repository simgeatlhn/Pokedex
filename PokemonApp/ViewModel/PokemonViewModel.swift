//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import Foundation
import UIKit //for UIColor

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var searchText = ""
    
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon { pokemon in
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }
    }
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemon : pokemon.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    //fetch data
    func fetchPokemon(completion: @escaping ([Pokemon]) -> Void) {
        guard let url = URL(string: baseUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            //guard let data = data else { return }
            guard let data = data?.parseData(removeString: "null,") else { return } //formated
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            completion(pokemon)
        }
        task.resume()
    }
}

extension Data {
    func parseData(removeString  string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
