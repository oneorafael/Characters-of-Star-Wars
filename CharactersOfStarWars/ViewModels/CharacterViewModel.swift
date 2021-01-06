//
//  CharacterViewModel.swift
//  CharactersOfStarWars
//
//  Created by Rafael Oliveira on 02/01/21.
//

import Foundation
struct CharacterViewModel {
     let character: Character!
    
    init(_ character: Character) {
        self.character = character
    }
    
    var name: String {return character.name}
    var gender: String {return character.gender}
    var height: String {return character.height}
    var birth_year: String {return character.birth_year}
}

