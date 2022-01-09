//
//  WeatherMethod.swift
//  climateApp
//
//  Created by cem sezeroglu on 11.12.2021.
//

import Foundation

struct WeatherMethod {
    static let url = URL(string: "https://api.openweathermap.org/data/2.5/weather")
    static let path = ""
    
    //Buranın get olmasının sebebi servisten veri çekme isteğinden dolayı.
    struct Get {
        //Url queryisini oluşturuğumuz oluşturduğumuz model
        struct Query: Encodable {
            let q: String?
            let lat: String?
            let lon: String?
            let appid: String?
        }
        
        struct Response: Decodable {
            let coord: Coord?
            let weather: [Weather]?
            let base: String?
            let main: Main?
            let visibility: Int?
            let wind: Wind?
            let clouds: Clouds?
            let dt: Date?
            let sys: Sys?
            let id: Int?
            let name: String?
            let cod: Int?
            
            struct Clouds: Decodable {
                let all: Int?
            }
            
            struct Coord: Decodable {
                let lon, lat: Double?
            }
            
            struct Main: Decodable {
                let temp: Double?
                let pressure, humidity: Int?
                let tempMin, tempMax: Double?
                
                enum CodingKeys: String, CodingKey {
                    case temp, pressure, humidity
                    case tempMin = "temp_min"
                    case tempMax = "temp_max"
                }
            }
            
            struct Sys: Decodable {
                let type, id: Int?
                let message: Double?
                let country: String?
                let sunrise, sunset: Date?
            }
            
            struct Weather: Decodable {
                let id: Int?
                let main, weatherDescription, icon: String?
                
                enum CodingKeys: String, CodingKey {
                    case id, main
                    case weatherDescription = "description"
                    case icon
                }
            }
            
            struct Wind: Decodable {
                let speed: Double?
                let deg: Int?
            }
        }
        
        let query: Query
        
        func send(with request: Remote.Request) throws -> Response {
            try Remote.Request(with: request)
                .set(method: .get)
                .set(url: url?.appendingPathComponent(WeatherMethod.path),query: query)
                .send()
        }
    }
}
