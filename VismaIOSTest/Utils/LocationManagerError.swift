//
//  LocationManagerError.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation


enum LocationManagerError: Error {
    case notDetermined
    case restrictedByTheUser
    case deniedByTheUser
    case unableToDetermineLocation
}


extension LocationManagerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notDetermined:
            return NSLocalizedString("An unexpected error has occurred", comment: "")

        case .restrictedByTheUser:
            return NSLocalizedString("GPS has being restricted by the user", comment: "")

        case .deniedByTheUser:
            return NSLocalizedString("GPS access has being denied by the user", comment: "")

        case .unableToDetermineLocation:
            return NSLocalizedString("Poor GPS signal", comment: "")
        }
    }
}
