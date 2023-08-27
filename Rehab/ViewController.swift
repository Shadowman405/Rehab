//
//  ViewController.swift
//  Rehab
//
//  Created by Maxim Mitin on 27.08.23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TVC: UITableView!
    var peoples: [Person] = []
    let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //fetchPersons()
        TVC.dataSource = self
        TVC.delegate = self
        view.addSubview(TVC)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let person = peoples[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    
    
    
//    func fetchPersons() {
//        NetworkManager.shared.getPeople { response in
//            switch response{
//            case .success(let peoples):
//                print(peoples)
//                self.peoples = peoples.results
//            case.failure(let error):
//                print(error)
//            }
//        }
//    }

}

