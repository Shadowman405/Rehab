//
//  PersonViewController.swift
//  Rehab
//
//  Created by Maxim Mitin on 28.08.23.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var skinColorLbl: UILabel!
    @IBOutlet weak var hairColorLbl: UILabel!
    @IBOutlet weak var filmsLbl: UILabel!
    
    
    var personDetailed: Person?
    private var films: [String] = []
    var networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        
        var filmsString = ""
        
        if let personDetailed = personDetailed {
            nameLbl.text = "Name: \(personDetailed.name)"
            heightLbl.text = "Height: \(personDetailed.height)"
            massLbl.text = "Mass: \(personDetailed.mass)"
            genderLbl.text = "Gender: " + personDetailed.gender.capitalized
            skinColorLbl.text = "Skin color: " + personDetailed.skinColor.capitalized
            hairColorLbl.text = "Hair color: " + personDetailed.hairColor.capitalized
            
            for film in personDetailed.films {
                networkManager.getFilms(urlString: film) { response in
                    switch response{
                    case .success(let film):
                        self.films.append(film.title)
                        print(film.title)
                    case.failure(let error):
                        print(error)
                    }
                }
                
                for i in films {
                    filmsString.append(i)
                }
                
                filmsLbl.text = filmsString
            }
        }
    }

}
