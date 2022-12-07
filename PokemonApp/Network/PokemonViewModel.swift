//
//  PokemonViewModel.swift
//  PokemonApp
//
//  Created by simge on 27.11.2022.
//

import Foundation
import UIKit

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var searchText = ""
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon { result in
            switch result {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self.pokemon = pokemon
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemon : pokemon.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    func fetchPokemon(completion: @escaping (Result<[Pokemon], PokemonError>) -> Void) {
        guard let requestURL = URL(string: baseUrl) else {
            completion(.failure(.urlError))
            return
        }
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.responseError))
                return
            }
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            do {
                guard let data = data.parseData(removeString: "null,") else { return }
                guard let response = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                completion(.failure(.decodingError))
            }
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
