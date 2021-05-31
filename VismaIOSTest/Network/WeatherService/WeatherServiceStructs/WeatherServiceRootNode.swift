//
//  WeatherServiceRootNode.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation

struct WeatherServiceRootNode: Decodable {
    let weather:[WeatherServiceWeatherNode]
    let main: WeatherServiceMainNode
    let name: String
}




struct WeatherServiceWeatherNode: Decodable {
    let main:String
}


struct WeatherServiceMainNode: Decodable {
    let temp:Double
}
