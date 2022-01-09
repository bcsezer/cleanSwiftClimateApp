//
//  HomeViewController.swift
//  climateApp
//
//  Created by cem sezeroglu on 8.12.2021.
//

import UIKit
import MapKit

protocol HomeViewDisplayLogic: AnyObject {
    func display(viewModel: Home.Weather.ViewModel)
}

class HomeView: UIViewController, HomeViewDisplayLogic{
    
    static func makeHomeView() -> UIViewController {
        let viewController = HomeView(nibName: "HomeView", bundle: nil)
        let interactor = HomeViewInteractor()
        let presenter = HomeViewPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
    
    var interactor: HomeViewBusinessLogic?
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak private var cityName: UILabel!
    @IBOutlet weak private var temperatureLabel: UILabel!
    @IBOutlet weak private var tempIcon: UIImageView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        
        inputTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLocationServiceAvaliable()
    }
    
    func display(viewModel: Home.Weather.ViewModel) {
        self.cityName.text = viewModel.name
        self.temperatureLabel.text = viewModel.temp
    }
    
    private func checkLocationServiceAvaliable() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}
