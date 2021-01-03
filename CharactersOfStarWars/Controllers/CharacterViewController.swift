//
//  CharacterViewController.swift
//  CharactersOfStarWars
//
//  Created by Rafael Oliveira on 02/01/21.
//

import UIKit
class CharacterViewController: UIViewController {
//    MARK: - IBoutlets
    @IBOutlet weak var nameLabel: UILabel!
    
    var CharacterVM: CharacterViewModel!
    override func viewDidLoad() {
        setup()
    }
    
//    MARK: - Functions
    
    /* func setup()
     * set large title
     * get dat from api
     * reload viewController to aply data
     */
    private func setup(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let random = Int.random(in: 0...83)
        let url = URL(string: "https://swapi.dev/api/people/\(random)/")!
        
        Webservice().getService(url: url) { character in
            if let character = character {
                self.CharacterVM = CharacterViewModel(character)
                DispatchQueue.main.async {
                    self.nameLabel.text = self.CharacterVM.name
                    self.title = self.CharacterVM.name
                    self.viewWillAppear(true)
                }
                print(self.CharacterVM.name)
            }
        }
    }
    
    @IBAction func reloadCharacterButtonPressed(_ sender: UIButton) {
        setup()
    }
    
}
