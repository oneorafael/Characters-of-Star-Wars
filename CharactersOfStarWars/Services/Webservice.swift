//
//  Webservice.swift
//  CharactersOfStarWars
//
//  Created by Rafael Oliveira on 02/01/21.
//

import Foundation
class Webservice {
    // criar função que retorna os dados da API (getfunc)
    func getService(url: URL, completion:@escaping(Character?)->()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil)
                print(error.localizedDescription)
            } else if let data = data {
                let character = try? JSONDecoder().decode(Character.self, from: data)
                if let character = character {
                    completion(character)
                }
            }
        }.resume()
    }
}
