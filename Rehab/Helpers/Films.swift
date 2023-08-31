//
//  Films.swift
//  Rehab
//
//  Created by Maxim Mitin on 31.08.23.
//

import Foundation

struct Films: Codable {
    let title: String
    let episode: Int
    let releaseDate: String
    
    private enum CodingKeys : String, CodingKey {
        case title, episode = "episode_id", releaseDate = "release_date"
    }
}
