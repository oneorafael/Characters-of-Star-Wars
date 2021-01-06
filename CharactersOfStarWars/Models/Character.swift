//
//  Character.swift
//  CharactersOfStarWars
//
//  Created by Rafael Oliveira on 02/01/21.
//

import Foundation
struct Character: Decodable {
    let name: String
    let gender: String
    let height: String
    let birth_year: String
}
