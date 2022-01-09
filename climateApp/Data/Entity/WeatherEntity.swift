//
//  WeatherEntity.swift
//  climateApp
//
//  Created by cem sezeroglu on 16.12.2021.
//

import Foundation

struct WeatherEntity {
    let weather: [Weather]
    let wind: Wind
    let clouds: Clouds
    let main: Main
    let cityName: String?
}

struct Weather {
    let id: Int
    let main, weatherDescription, icon: String
}

struct Wind {
    let speed: Double
    let deg: Int
}

struct Main {
    let temp: Double
    let pressure, humidity: Int
    let tempMin, tempMax: Double
}

struct Clouds {
    let all: Int?
}
