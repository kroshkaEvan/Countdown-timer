//
//  Device.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 5.07.22.
//

import Foundation

struct Device {
    static let shared = Device()
    
    let iPads: [String] = ["iPad (9th generation)", "iPad Air (4th generation)", "iPad Pro (9.7-inch)", "iPad Pro (11-inch) (3rd generation)", "iPad Pro (12.9-inch) (5th generation)", "iPad mini (6th generation)"]
    
    let iPhones: [String] = ["iPhone SE (1st generation)", "iPhone SE (2nd generation)",
                             "iPhone 7", "iPhone 7 Plus",
                             "iPhone 8", "iPhone 8 Plus", "iPhone X",
                             "iPhone Xʀ", "iPhone Xs", "iPhone Xs Max",
                             "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max",
                             "iPhone 12 mini", "iPhone 12", "iPhone 12 Pro", "iPhone 12 Pro Max",
                             "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro", "iPhone 13 Pro Max"]
}
