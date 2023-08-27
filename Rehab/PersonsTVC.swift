//
//  PersonsTVC.swift
//  Rehab
//
//  Created by Maxim Mitin on 28.08.23.
//

import UIKit

class PersonsTVC: UITableViewController {
    var peoples: [Person] = [Person(name: "", height: "", mass: "", gender: "")]
    let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPersons()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return peoples.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = peoples[indexPath.row]
        cell.textLabel?.text = "beep"

        return cell
    }
    
    func fetchPersons() {
        networkManager.getPeople { response in
            switch response{
            case .success(let peoples):
                print(peoples)
                self.peoples = peoples.results
            case.failure(let error):
                print(error)
            }
        }
        tableView.reloadData()
    }
}
