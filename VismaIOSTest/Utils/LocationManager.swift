//
//  LocationManager.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation
import CoreLocation

class LocationManager:NSObject {
    // - Private
    private let locationManager = CLLocationManager()
    private var lMDelegate: LocationManagerDelegate

    // - API
    public var exposedLocation: CLLocation? {
        return self.locationManager.location
    }

    init(delegate: LocationManagerDelegate) {
        lMDelegate = delegate
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

// MARK: - Core Location Delegate
extension LocationManager: CLLocationManagerDelegate {


    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {

        switch status {
        case .notDetermined         : print("notDetermined")        // location permission not asked for yet
        case .authorizedWhenInUse   : print("authorizedWhenInUse")  // location authorized
        case .authorizedAlways      : print("authorizedAlways")     // location authorized
        case .restricted            : print("restricted")           // TODO: handle
        case .denied                : print("denied")               // TODO: handle
        @unknown default            : print("unknown")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            lMDelegate.locationStateChange(latitude: latitude, longitude: longitude, error: nil)
        } else {
            lMDelegate.locationStateChange(latitude: 0, longitude: 0, error: .unableToDetermineLocation)
        }
    }
}


// MARK: - Get Placemark
extension LocationManager {


    func getPlace(for location: CLLocation,
                  completion: @escaping (CLPlacemark?) -> Void) {

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in

            guard error == nil else {
                print("*** Error in \(#function): \(error!.localizedDescription)")
                completion(nil)
                return
            }

            guard let placemark = placemarks?[0] else {
                print("*** Error in \(#function): placemark is nil")
                completion(nil)
                return
            }

            completion(placemark)
        }
    }
}


// MARK: - Delegate definition
protocol LocationManagerDelegate {
    func locationStateChange(latitude: Double, longitude: Double ,error: LocationManagerError?)
}
