//
//  WeatherServiceParserTest.swift
//  VismaIOSTestTests
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import XCTest
@testable import VismaIOSTest

class WeatherServiceParserTest: XCTestCase {

    var sut: WeatherResponseParser!

    let testJSON = """
{
    "coord": {
        "lon": -3.7038,
        "lat": 40.4168
    },
    "weather": [
        {
            "id": 801,
            "main": "Clouds",
            "description": "few clouds",
            "icon": "02d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 29.82,
        "feels_like": 28.52,
        "temp_min": 28.45,
        "temp_max": 31.68,
        "pressure": 1012,
        "humidity": 29
    },
    "visibility": 10000,
    "wind": {
        "speed": 4.47,
        "deg": 248,
        "gust": 6.26
    },
    "clouds": {
        "all": 20
    },
    "dt": 1622479171,
    "sys": {
        "type": 2,
        "id": 2007545,
        "country": "ES",
        "sunrise": 1622436444,
        "sunset": 1622489879
    },
    "timezone": 7200,
    "id": 3117735,
    "name": "Madrid",
    "cod": 200
}
"""

    override func setUpWithError() throws {
        try super.setUpWithError()
        let data = testJSON.data(using: .utf8)
        sut = WeatherResponseParser(data: data)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testWeatherServiceParserCity() throws {
        let result = sut.parse()

        guard let weather = try? result.get() else {
            XCTFail("Failure on weather parsing")
            return
        }

        XCTAssertEqual(weather.city, "Madrid", "Failure on weather city parsing")
    }

    func testWeatherServiceParserCondition() throws {
        let result = sut.parse()

        guard let weather = try? result.get() else {
            XCTFail("Failure on weather parsing")
            return
        }

        XCTAssertEqual(weather.condition, "Clouds", "Failure on weather condition parsing")
    }

    func testWeatherServiceParser() throws {
        let result = sut.parse()

        guard let weather = try? result.get() else {
            XCTFail("Failure on weather parsing")
            return
        }

        XCTAssertEqual(weather.temperature, 29.82, "Failure on weather condition parsing")
    }
}
