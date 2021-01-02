//
//  CharacterViewController.swift
//  CharactersOfStarWars
//
//  Created by Rafael Oliveira on 02/01/21.
//

import UIKit
class CharacterViewController: UIViewController {
    override func viewDidLoad() {
        setup()
    }
    
    private func setup(){
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
