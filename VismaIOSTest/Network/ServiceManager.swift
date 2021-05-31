//
//  ServiceManager.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 31/5/21.
//

import Foundation

class ServiceManager {
    static let sharedInstance = ServiceManager()


    // Initialization

    /*
    private init() {
        if let serviceKey = (Bundle.main.object(forInfoDictionaryKey: "OpenWeatherKey") as? String) {
            self.serviceKey = serviceKey
        } else {
            self.serviceKey = ""
            print("ERROR: Open weather key not present in info.plist")
        }
        self.urls = ((Bundle.main.object(forInfoDictionaryKey: "ServerURLs") as? Dictionary<String,Any>)) ?? [:]
        if let baseUrl = self.urls["BaseURL"] as? String {
            self.baseUrl = baseUrl
        } else {
            self.baseUrl = ""
            print("ERROR: BaseURL not present in info.plist")
        }

        self.urlSession = URLSession(configuration: .default)

    }*/
}
