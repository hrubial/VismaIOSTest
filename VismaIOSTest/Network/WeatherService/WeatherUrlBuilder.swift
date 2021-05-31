//
//  WeatherUrlBuilder.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation

struct WeatherUrlBuilder {
    let latitude: Double
    let longitude: Double
}

extension WeatherUrlBuilder {
    enum Constants {
        static let endpoint = "https://api.openweathermap.org/data/2.5/weather"
        static let weatherServiceAppidParam = "appid"
        static let weatherServiceAppidValue = "7f5f1dd835c932494a744276ff7b602a"
        static let unitParam = "units"
        static let unitMetricValue = "metric"
        static let latitudeParam = "lat"
        static let longitudeParam = "lon"
    }

    func build() -> URL? {
        var components = URLComponents(string: Constants.endpoint)
        let queryItems = [
            URLQueryItem(name: Constants.weatherServiceAppidParam, value: Constants.weatherServiceAppidValue),
            URLQueryItem(name: Constants.unitParam, value: Constants.unitMetricValue),
            URLQueryItem(name: Constants.latitudeParam, value: String(latitude)),
            URLQueryItem(name: Constants.longitudeParam, value: String(longitude))
        ]
        components?.queryItems = queryItems

        return components?.url
    }
}
