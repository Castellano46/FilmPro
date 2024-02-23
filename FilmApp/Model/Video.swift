//
//  Video.swift
//  FilmApp
//
//  Created by Pedro on 20/2/24.
//

import Foundation

struct Video: Identifiable, Decodable, Hashable {
    let id: UUID
    let url: String
    let title: String
    let image: String
    //let isHost: Bool
}
