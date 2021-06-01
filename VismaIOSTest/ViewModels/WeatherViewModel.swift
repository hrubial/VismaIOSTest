//
//  WeatherViewModel.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation
import CoreLocation


class WeatherViewModel {
    let weatherViewController: WeatherViewController
    lazy var locationManager = LocationManager(delegate: self)
    let weatherService = WeatherService()

    init(weatherViewController: WeatherViewController) {
        self.weatherViewController = weatherViewController
        locationManager.startUpdating()
    }

    deinit {
        stopUpdating()
    }
    
    func stopUpdating() {
        locationManager.stopUpdating()
    }
}


// - MARK: Service calls
extension WeatherViewModel {
    func updateWeatherForLocation(latitude: Double, longitude: Double) {
        weatherService.getWeather(latitude: latitude, longitude: longitude) { weather, error in
            self.refreshWeatherUI(weather: weather)
            if error != nil {
                self.refreshError(errorString: error?.localizedDescription ?? "Unknown error on service")
            }
        }
    }
}


// - MARK: refresh UI methods
extension WeatherViewModel {
    func refreshWeatherUI(weather:WeatherObj?) {
        if let weather = weather {
            self.weatherViewController.temperatureLabel.text = String(format: "%.01fº", weather.temperature)
            self.weatherViewController.cityLabel.text = weather.city
            self.weatherViewController.conditionLabel.text = weather.condition
        } else {
            self.weatherViewController.temperatureLabel.text = "-"
            self.weatherViewController.cityLabel.text = "-"
            self.weatherViewController.conditionLabel.text = "-"
        }
    }


    func refreshError(errorString: String) {
        weatherViewController.gpsStatusLabel.text = errorString
    }

    func refreshGpsStatus(status: String) {
        weatherViewController.gpsStatusLabel.text = status
    }
}


// - MARK: GPS Handling
extension WeatherViewModel: LocationManagerDelegate {
    func locationStateChange(status: LocationManagerStatus, error: LocationManagerError?) {
        switch status {
        case .initial:
            self.refreshGpsStatus(status: "Checking permissions")

        case .gpsGranted:
            self.refreshGpsStatus(status: "Detecting GPS position")

        case .gpsPositionFound:
            self.refreshGpsStatus(status: "Requesting weather data")

        case .errorFound:
            var message = ""
            if error != nil {
                message = error?.localizedDescription ?? "Unkown error on gps"
            }
            refreshError(errorString: message)

        default:
            break
        }
    }


    func locationStateChange(latitude: Double, longitude: Double, error: LocationManagerError?) {
        weatherViewController.gpsStatusLabel.text = String("lat: \(latitude) long: \(latitude)")
        updateWeatherForLocation(latitude: latitude, longitude: longitude)
    }
}
