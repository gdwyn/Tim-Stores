//
//  ItemsModel.swift
//  Tim Store
//
//  Created by Godwin IE on 05/07/2024.
//

import Foundation

struct ItemsModel: Codable, Identifiable {
    let id: String
    let name: String
    let description: String?
    let photos: [PhotoModel]
    //let current_price: [PriceModel]

//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case description
//        case photos
//        case currentPrice = "current_price"
//    }
}
