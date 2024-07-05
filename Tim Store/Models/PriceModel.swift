//
//  PriceModel.swift
//  Tim Store
//
//  Created by Godwin IE on 05/07/2024.
//

import Foundation

struct PriceModel: Codable {
    let NGN: [Double?]

    enum CodingKeys: String, CodingKey {
        case NGN
    }
}
