//
//  DataManager.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation

class DataManager {
    static let shared = DataManager()

    var user:GoogleUser?{
        didSet {
            NotificationCenter.default.post(name: .userUpdatedKey, object: user)
        }
    }
}

