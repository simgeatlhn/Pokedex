//
//  PokemonError.swift
//  PokemonApp
//
//  Created by simge on 6.12.2022.
//

import Foundation

enum PokemonError: Error {
    case decodingError
    case dataError
    case urlError
    case responseError

    var localizedDescription: String {
        switch self {
        case .decodingError:
            return "Decode error"
        case .dataError:
            return "Data error"
        case .urlError:
            return "URL error"
        case .responseError:
            return "Response error"
        }
    }
}
