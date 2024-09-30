//
//  Model.swift
//  FreeGames
//
//  Created by Turma01-15 on 30/09/24.
//

import Foundation

struct Games: Codable, Identifiable {
    let id: Int
    let title: String?
    let thumbnail: String?
    let short_description: String?
    let game_url: String?
    let genre: String?
    let platform: String?
    let publisher: String?
    let developer: String?
    let release_date: String?
    let freetogame_profile_url: String?
}
