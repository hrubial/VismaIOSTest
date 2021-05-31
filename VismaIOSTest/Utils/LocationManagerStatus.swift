//
//  LocationStatus.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation

enum LocationManagerStatus {
    case initial
    case gpsGranted
    case gpsPositionFound
    case dataOk
    case errorFound
}
