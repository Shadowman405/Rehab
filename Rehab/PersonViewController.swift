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
    
    var personDetailed: Person = Person(name: "", height: "", mass: "", gender: "")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        nameLbl.text = "Name: \(personDetailed.name)"
        heightLbl.text = "Height: \(personDetailed.height)"
        massLbl.text = "Mass: \(personDetailed.mass)"
        genderLbl.text = "Gender: \(personDetailed.gender)"
    }

}
