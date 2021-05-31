//
//  WeatherResponseParser.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation

struct WeatherResponseParser {
    let data: Data?
}

extension WeatherResponseParser {
    func parse() -> Result<WeatherObj, WeatherApiError> {
        guard let data = data else {
            return .failure(.dataParsing)
        }

        let decoder = JSONDecoder()

        guard let weatherServiceNode = try? decoder.decode(WeatherServiceRootNode.self, from: data) else {
            return .failure(.dataParsing)
        }

        let weatherObj = WeatherObj(city: weatherServiceNode.name, condition: (weatherServiceNode.weather.first?.main) ?? "-" , temperature: weatherServiceNode.main.temp)

        return .success(weatherObj)
    }
}
