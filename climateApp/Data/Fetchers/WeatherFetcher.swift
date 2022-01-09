//
//  WeatherFetcher.swift
//  climateApp
//
//  Created by cem sezeroglu on 16.12.2021.
//

import Foundation

protocol WeatherFetcherProtocol: AnyObject {
    func getWeather(cityName: String?, lat: String?, lon: String?, appid: String) throws -> WeatherEntity
}

class WeatherFetcher: WeatherFetcherProtocol {
    static let shared = WeatherFetcher()
    
    func getWeather(cityName: String?, lat: String?, lon: String?, appid: String) throws -> WeatherEntity {
        let response = try WeatherEndpoint.shared.getWeather(city: cityName, lat: lat, lon: lon, appid: appid)
        
        var weathers = [Weather]()
        
        response.weather?.forEach({ weather in
            weathers.append(
                Weather(id: weather.id ?? 0,
                        main: weather.main ?? "",
                        weatherDescription: weather.weatherDescription ?? "",
                        icon: weather.icon ?? "")
            )
        })
        
        return WeatherEntity(
            weather: weathers,
            wind: Wind(
                speed: response.wind?.speed ?? 0.0,
                deg: response.wind?.deg ?? 0),
            clouds: Clouds(all: response.clouds?.all ?? 0),
            main: Main(temp: response.main?.temp ?? 0.0,
                       pressure: response.main?.pressure ?? 0,
                       humidity: response.main?.humidity ?? 0,
                       tempMin: response.main?.tempMin ?? 0.0,
                       tempMax: response.main?.tempMax ?? 0.0
            ), cityName: cityName
        )
    }
}
