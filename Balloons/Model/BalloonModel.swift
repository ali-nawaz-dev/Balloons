//
//  BalloonModel.swift
//  Balloons
//
//  Created by Rashdan Natiq on 16/09/2021.
//

import Foundation

struct Balloon: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let description: String
    let price: Int
    let availableSince: String
}

