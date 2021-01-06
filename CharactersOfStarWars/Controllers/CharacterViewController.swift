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
    @IBOutlet weak var birth_yearLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var AIndicatorLoading: UIActivityIndicatorView!
    var random: Int = 0
    
    var CharacterVM: CharacterViewModel!
    override func viewDidLoad() {
        setup()
    }
    
//    MARK: - Functions
    
    /* func setup()
     * sort a random number and get data from API
     * reload viewController to aply data
     */
    private func setup(){
        self.random = Int.random(in: 0...83)
        print("random number is: \(random)")
        
        let url = URL(string: "https://swapi.dev/api/people/\(random)/")!
        
        loadingView.isHidden = false
        AIndicatorLoading.startAnimating()
        
        Webservice().getService(url: url) { character in
            if let character = character {
                self.CharacterVM = CharacterViewModel(character)
                DispatchQueue.main.async {
                    
                    let name = "Name: \(self.CharacterVM.name)"
                    let gender = "Gender: \(self.CharacterVM.gender)"
                    let birth_year = "Birth year: \(self.CharacterVM.birth_year)"
                    let height = "height:  \(self.CharacterVM.height)"
                    
                    self.nameLabel.text = name
                    self.genderLabel.text = gender
                    self.birth_yearLabel.text = birth_year
                    self.heightLabel.text = height
                    
                    self.viewWillAppear(true)
                    self.loadingView.isHidden = true
                    self.AIndicatorLoading.stopAnimating()
                    self.AIndicatorLoading.isHidden = true
                    
                }
                print(self.CharacterVM.name)
            }
        }
        
    }
    
    @IBAction func reloadCharacterButtonPressed(_ sender: UIButton) {
        setup()
    }
    
    
}
