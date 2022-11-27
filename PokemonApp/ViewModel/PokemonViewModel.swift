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
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json" //endpoint
    
    init() {
        fetchPokemon()
    }
    
    //fetch data
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //guard let data = data else { return }
            guard let data = data?.parseData(removeString: "null,") else { return } //formated
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            //reload data
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }
        .resume() //**
    }
}

//api dan gelen null, string kısmını silmek için kullanılan fonksiyon
extension Data {
    func parseData(removeString  string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
