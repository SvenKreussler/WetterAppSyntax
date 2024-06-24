//
//  HTTPError.swift
//  Wetter
//
//  Created by Sven Kreußler on 29.11.23.
//

import Foundation

enum HTTPError: Error {
    case invalidURL
    case missingData
}
