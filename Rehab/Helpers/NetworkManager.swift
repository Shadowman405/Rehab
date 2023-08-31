//
//  NetworkManager.swift
//  Rehab
//
//  Created by Maxim Mitin on 27.08.23.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    var mockPersonArray = [Person(name: "Loading...", height: "", mass: "", gender: "", hairColor: "", skinColor: "", films: [], vehicles: [])]
    
    private init() {}
    
    func getPeople(tableView: UITableView, completion: @escaping (Result<SwapiPersonResults, Error>) -> Void) {
        guard let url = URL(string: "https://swapi.dev/api/people")
        else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let persons = try JSONDecoder().decode(SwapiPersonResults.self, from: data)
                    completion(.success(persons))
                }
                catch {
                    completion(.failure(error.localizedDescription as! Error))
                }
            }
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }.resume()
    }
}
