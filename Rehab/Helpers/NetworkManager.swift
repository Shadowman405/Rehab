//
//  NetworkManager.swift
//  Rehab
//
//  Created by Maxim Mitin on 27.08.23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getPeople(completion: @escaping (Result<SwapiPersonResults, Error>) -> Void) {
        guard let url = URL(string: "https://swapi.dev/api/people")
        else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let persons = try JSONDecoder().decode(SwapiPersonResults.self, from: data)
                    print(persons.results)
                    completion(.success(persons))
                }
                catch {
                    completion(.failure(error.localizedDescription as! Error))
                }
            }
        }.resume()
    }
}
