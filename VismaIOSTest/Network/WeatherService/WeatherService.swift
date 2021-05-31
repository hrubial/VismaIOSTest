//
//  WeatherService.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation

class WeatherService {
    func getWeather(latitude:Double, longitude:Double, completion: @escaping (Result<WeatherObj, WeatherApiError>) -> Void) {
        let builder = WeatherUrlBuilder(latitude: latitude, longitude: longitude)

        guard let url = builder.build() else {
            return completion(.failure(.urlCreation))
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if error == nil {
                let parser = WeatherResponseParser(data: data)
                let result = parser.parse()

                DispatchQueue.main.async {
                    completion(result)
                }
            }
        }
        task.resume()
    }
}
