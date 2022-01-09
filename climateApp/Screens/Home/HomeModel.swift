//
//  HomeModel.swift
//  climateApp
//
//  Created by cem sezeroglu on 8.12.2021.
//

import Foundation

enum Home {
    
    enum Weather {
        struct Request {
            let cityName: String?
            let lat: String?
            let lon: String?
        }
        struct Response {
            let weather: WeatherEntity
        }
        struct ViewModel {
            let name: String
            let temp: String
            let icon: String
        }
    }
}
