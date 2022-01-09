//
//  ServiceException.swift
//  climateApp
//
//  Created by cem sezeroglu on 11.12.2021.
//

import Foundation
struct ServiceException: Decodable {
    let code: String?
    let message: String?
}
