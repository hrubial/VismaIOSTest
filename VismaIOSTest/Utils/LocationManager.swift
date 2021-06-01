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
    private var lMDelegate: LocationManagerDelegate?

    // - API
    public var exposedLocation: CLLocation? {
        return self.locationManager.location
    }

    init(delegate: LocationManagerDelegate?) {
        lMDelegate = delegate
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.requestWhenInUseAuthorization()
    }

    func startUpdating() {
        self.locationManager.startUpdatingLocation()
    }

    func stopUpdating() {
        self.locationManager.stopUpdatingLocation()
    }
}

// MARK: - Core Location Delegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        switch status {
        case .notDetermined:
            // location permission not asked for yet
            lMDelegate?.locationStateChange(status: .initial, error: .notDetermined)
        case .authorizedWhenInUse, .authorizedAlways:
            // location authorized
            lMDelegate?.locationStateChange(status: .gpsGranted, error: nil)
        case .restricted:
            // location authorized
            lMDelegate?.locationStateChange(status: .errorFound, error: .restrictedByTheUser)

        case .denied:
            lMDelegate?.locationStateChange(status: .errorFound, error: .deniedByTheUser)
        @unknown default:
            lMDelegate?.locationStateChange(status: .errorFound, error: .unableToDetermineLocation)
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            lMDelegate?.locationStateChange(latitude: latitude, longitude: longitude, error: nil)
        } else {
            lMDelegate?.locationStateChange(latitude: 0, longitude: 0, error: .unableToDetermineLocation)
        }
    }
}


// MARK: - Get Placemark
extension LocationManager {
    func getPlace(
        for location: CLLocation,
        completion: @escaping (CLPlacemark?) -> Void
    ) {
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
    func locationStateChange(status: LocationManagerStatus, error: LocationManagerError?)
    func locationStateChange(latitude: Double, longitude: Double, error: LocationManagerError?)
}
