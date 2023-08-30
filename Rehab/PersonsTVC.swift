//
//  PersonsTVC.swift
//  Rehab
//
//  Created by Maxim Mitin on 28.08.23.
//

import UIKit

class PersonsTVC: UITableViewController {
    let networkManager = NetworkManager.shared
    var peoples: [Person] = []

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
        cell.textLabel?.text = person.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toPerson", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPerson" {
            let vc = segue.destination as? PersonViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            vc?.personDetailed = peoples[indexPath!.row]
        }
    }
    
    //MARK: - Funcs
    func fetchPersons() {
        peoples = networkManager.mockPersonArray
        
        networkManager.getPeople(tableView: tableView) { response in
            switch response{
            case .success(let peoples):
                self.peoples = peoples.results
                print(self.peoples.count)
            case.failure(let error):
                print(error)
            }
        }
    }
}
