//
//  GetLocationExtension.swift
//  climateApp
//
//  Created by cem sezeroglu on 9.01.2022.
//

import Foundation
import MapKit

extension HomeView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        interactor?.handle(request: Home.Weather.Request(cityName: nil, lat: (locValue.latitude).doubletoString(), lon: locValue.longitude.doubletoString()))
    }
}
