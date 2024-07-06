//
//  AppErrors.swift
//  Tim Store
//
//  Created by Godwin IE on 05/07/2024.
//

import Foundation

enum AppErrors: String, Error {
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidURL = "The url provided is invalid. Please try again."
    case invalidData = "The data provided is invalid. Please try again."
}
