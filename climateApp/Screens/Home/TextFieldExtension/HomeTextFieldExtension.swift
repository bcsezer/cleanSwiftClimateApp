//
//  HomeTextFieldExtension.swift
//  climateApp
//
//  Created by cem sezeroglu on 9.01.2022.
//

import Foundation
import UIKit

extension HomeView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchingText = inputTextField.text else { return false }
        textField.resignFirstResponder()
        interactor?.handle(request: Home.Weather.Request(cityName: searchingText, lat: nil, lon: nil))
        return true
    }
}
