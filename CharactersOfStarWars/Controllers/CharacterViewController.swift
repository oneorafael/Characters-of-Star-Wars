//
//  CharacterViewController.swift
//  CharactersOfStarWars
//
//  Created by Rafael Oliveira on 02/01/21.
//

import UIKit
class CharacterViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var CharacterVM: CharacterViewModel!
    override func viewDidLoad() {
        setup()
        
    }
    
    
    private func setup(){
        navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://swapi.dev/api/people/1/")!
        Webservice().getService(url: url) { character in
            if let character = character {
                self.CharacterVM = CharacterViewModel(character)
                DispatchQueue.main.async {
                    self.nameLabel.text = self.CharacterVM.name
                    self.viewWillAppear(true)
                }
//                TODO: Colocar o dado no label antes dele carregar
                print(self.CharacterVM.name)
            }
        }
    }
}
