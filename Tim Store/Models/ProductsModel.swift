//
//  ProductsModel.swift
//  Tim Store
//
//  Created by Godwin IE on 05/07/2024.
//

import Foundation

struct ProductsModel: Codable {
    let page: Int
    let size: Int
    let total: Int
    let items: [ItemsModel]
}
