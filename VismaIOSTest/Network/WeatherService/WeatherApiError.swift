//
//  WeatherApiError.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation

enum WeatherApiError: Error {
    case urlCreation
    case dataParsing
}


extension WeatherApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .urlCreation:
            return NSLocalizedString("An error has occurred while creating URL", comment: "")

        case .dataParsing:
            return NSLocalizedString("Data coming from server has unexpected structure", comment: "")
        }
    }
}
