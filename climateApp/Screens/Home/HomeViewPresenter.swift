//
//  HomeViewPresenter.swift
//  climateApp
//
//  Created by cem sezeroglu on 8.12.2021.
//

import Foundation

protocol HomeViewPresentationLogic {
    func present(response: Home.Weather.Response)
}

class HomeViewPresenter: HomeViewPresentationLogic {
    weak var viewController: HomeViewDisplayLogic?
    
    func present(response: Home.Weather.Response) {
        let cityName = response.weather.cityName ?? ""
        let temp = response.weather.main.temp.doubletoString()
        let icon = response.weather.weather.first?.icon
        
        viewController?.display(viewModel: Home.Weather.ViewModel(name: cityName, temp: temp, icon: icon ?? "" ))
    }
}
