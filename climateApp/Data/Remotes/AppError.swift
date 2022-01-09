//
//  AppError.swift
//  climateApp
//
//  Created by cem sezeroglu on 16.12.2021.
//

import Foundation

enum AppError: LocalizedError {
    case remote(code: String?, message: String?)

    var errorDescription: String? {
        switch self {
        case let .remote(code, message):
            return message ?? code ?? "Bilinmeyen hata"
        }
    }
}
