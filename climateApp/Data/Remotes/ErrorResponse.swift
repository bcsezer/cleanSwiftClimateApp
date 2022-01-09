//
//  ErrorResponse.swift
//  climateApp
//
//  Created by cem sezeroglu on 16.12.2021.
//

import Foundation

struct ErrorResponse: Decodable {
    let success: Bool?
    let error: [ServiceException]?
}
