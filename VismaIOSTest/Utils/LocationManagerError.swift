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
