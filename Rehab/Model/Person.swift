//
//  Person.swift
//  Rehab
//
//  Created by Maxim Mitin on 27.08.23.
//

import Foundation

struct SwapiPersonResults: Codable {
    let results: [Person]
}

struct Person: Codable, Hashable {
    let name: String
    let height: String
    let mass: String
    let gender: String
}
