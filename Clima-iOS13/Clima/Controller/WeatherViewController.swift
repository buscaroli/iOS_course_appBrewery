//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        weatherManager.delegate = self
        // Notify the View Controller when the user types something
        // Class needs to inherit from UITextFieldDelegate
        searchTextField.delegate = self // self refers to the current view controller
        
    }
        
    @IBAction func locationPressed(_ sender: Any) {
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
//        print(temperatureLabel.text ?? "Unknown")
//        print(searchTextField.text!)
    }
    
    // DELEGATE METHOD
    /*  Run when the user
     presses 'return' on the device's keyboard
     (The app will accept the user's text even if instead of clicking on the search button the user clicked on the 'return' button on the pop-up keyboard.)
     Without this code the user would need to click the search button in order to sumbit the search term.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    // DELEGATE METHOD
    // It prevents the user from leaving the textField, they are locked
    // in the keyboard session.
    // Useful for doing some validation (eg don't allow the user to submit data if the text field is empty).
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something here"
            return false
        }
    }
    
    // DELEGATE METHOD
    // The view controller will be notified when the text field ends editing.
    // What should I do once the user has finished entering the text? (eg has pressed 'return'? We might want to clear the text field.)
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Fetch the weather for the city in here
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }

        // Clear the text
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
//        print(weather.temperature)
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.decimalTemperature
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
