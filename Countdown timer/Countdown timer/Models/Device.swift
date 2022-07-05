//
//  Device.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 5.07.22.
//

import Foundation

struct Device {
    static let shared = Device()
    
    let iPads: [String] = ["iPad (6th generation)", "iPad (7th generation)", "iPad (8th generation)", "iPad (9th generation)",
                           "iPad mini (5th generation)", "iPad mini (6th generation)",
                           "iPad Air (3th generation)", "iPad Air (4th generation)",
                           "iPad Pro (9.7-inch)",
                           "iPad Pro (11-inch) (1rd generation)", "iPad Pro (11-inch) (2rd generation)", "iPad Pro (11-inch) (3rd generation)",
                           "iPad Pro (12.9-inch) (1th generation)", "iPad Pro (12.9-inch) (2th generation)",
                           "iPad Pro (12.9-inch) (3th generation)", "iPad Pro (12.9-inch) (4th generation)", "iPad Pro (12.9-inch) (5th generation)"]
    
    let iPhones: [String] = ["iPhone SE (1st generation)", "iPhone SE (2nd generation)",
                             "iPhone 7", "iPhone 7 Plus",
                             "iPhone 8", "iPhone 8 Plus", "iPhone X",
                             "iPhone Xʀ", "iPhone Xs", "iPhone Xs Max",
                             "iPhone 11", "iPhone 11 Pro", "iPhone 11 Pro Max",
                             "iPhone 12 mini", "iPhone 12", "iPhone 12 Pro", "iPhone 12 Pro Max",
                             "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro", "iPhone 13 Pro Max"]
}
