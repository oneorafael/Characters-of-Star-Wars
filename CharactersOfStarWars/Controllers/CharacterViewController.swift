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
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var AIndicatorLoading: UIActivityIndicatorView!
    
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
        loadingView.isHidden = false
        AIndicatorLoading.startAnimating()
        
        Webservice().getService(url: url) { character in
            if let character = character {
                self.CharacterVM = CharacterViewModel(character)
                DispatchQueue.main.async {
                    let name = "Nome: \(self.CharacterVM.name)"
                    let gender = "Genero: \(self.CharacterVM.gender)"
                    self.nameLabel.text = name
                    self.genderLabel.text = gender
                    self.title = self.CharacterVM.name
                    self.viewWillAppear(true)
                    self.loadingView.isHidden = true
                    self.AIndicatorLoading.stopAnimating()
                }
                print(self.CharacterVM.name)
            }
        }
    }
    
    @IBAction func reloadCharacterButtonPressed(_ sender: UIButton) {
        setup()
    }
    
    
}
