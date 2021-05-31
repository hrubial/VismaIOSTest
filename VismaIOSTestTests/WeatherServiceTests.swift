//
//  WeatherServiceTests.swift
//  VismaIOSTestTests
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import XCTest
@testable import VismaIOSTest

class WeatherServiceTests: XCTestCase {
    var sut: WeatherService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = WeatherService()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }


    func testFullOnlineService() throws {
        let latitude = 40.4167
        let longitude = -3.70325
        let promise = expectation(description: "Service response ok")

        sut.getWeather(latitude: latitude, longitude: longitude) { [weak self] result in
            guard
                let weather = try? result.get()
            else {
                XCTFail("Error on weather service")
                return
            }
            promise.fulfill()
        }

        wait(for: [promise], timeout: 10)
    }
}
