//
//  WeatherViewModel.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation
import CoreLocation


class WeatherViewModel {
    init() {

    }
}


// - MARK: Service calls
extension WeatherViewModel {

}


// - MARK: GPS Handling
extension WeatherViewModel: LocationManagerDelegate {
    func locationStateChange(latitude: Double, longitude: Double, error: LocationManagerError?) {
        
    }


    /*
    func locationStateChange(location: CLLocation?, error: String?) {

        if error == nil,
            location != nil,
            let lat = location?.coordinate.latitude,
            let lon = location?.coordinate.longitude {
            let gpsLocation = LocationWeatherObj(place: "", lat: lat, lon: lon)
            if !gpsLocation.isEqual(DataManager.sharedInstance.currentLocation) {
                DataManager.sharedInstance.currentLocation = gpsLocation
                refreshUI(currentState: .gpsPositionFound, location: nil, error: error)
                requestData(locationWeather: gpsLocation)
            }

        } else if error != nil {
            refreshUI(currentState: .errorFound, location: nil, error: error)
        } else {
            refreshUI(currentState: .errorFound, location: nil, error: "Error on gps adquisition")
        }
    }*/


}
