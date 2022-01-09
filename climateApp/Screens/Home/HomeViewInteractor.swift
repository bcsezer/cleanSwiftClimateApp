//
//  HomeViewInteractor.swift
//  climateApp
//
//  Created by cem sezeroglu on 8.12.2021.
//

import Foundation

protocol HomeViewBusinessLogic {
    func handle(request: Home.Weather.Request)
}

class HomeViewInteractor: HomeViewBusinessLogic {
    var presenter: HomeViewPresentationLogic?
    let fetcher: WeatherFetcherProtocol = WeatherFetcher.shared
    
    func handle(request: Home.Weather.Request) {
        DispatchQueue.global(qos: .utility).async {
            do {
                let response = try self.fetcher.getWeather(cityName: request.cityName, lat: request.lat, lon: request.lon, appid: Constants.appId )
                DispatchQueue.main.async {
                    self.presenter?.present(response: Home.Weather.Response(weather: response))
                }
            }catch{
                print("errorrrrrr")
            }
        }
    }
}
