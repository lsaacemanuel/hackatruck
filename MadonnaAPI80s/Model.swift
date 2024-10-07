//
//  Model.swift
//  Madonna80s
//
//  Created by Turma01-15 on 02/10/24.
//

import Foundation

struct Madonna: Codable {
    var _id: String?
    var nome: String?
    var musicas: [String]?
    var singles: [String]?
    var album: String?
    var covers: [String]?
}
extension Madonna: Identifiable {
    var id: String {
        _id!
    }
}
