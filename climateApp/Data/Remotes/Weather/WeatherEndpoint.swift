//
//  WeatherEndpoint.swift
//  climateApp
//
//  Created by cem sezeroglu on 16.12.2021.
//

import Foundation

class WeatherEndpoint: Remote.Endpoint {
    static let shared = WeatherEndpoint()
    
    private override init() {
        super.init()
        baseRequest.set(decoder: APIDecoder())
    }
    
    func getWeather(city: String?, lat: String?, lon: String?, appid: String) throws -> WeatherMethod.Get.Response {
        try WeatherMethod.Get(query: WeatherMethod.Get.Query(q: city, lat: lat, lon: lon, appid: appid)).send(with: baseRequest)
    }
}
