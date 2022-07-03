//
//  Time.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 3.07.22.
//

import Foundation

class TimerTime {
    static var allTime: Int = 86400
    
    static func startTimer() {
        allTime -= 1
    }
    
    static func getTimeIntDay() -> Int {
        return  allTime / (3600 * 24)
    }
    
    static func getTimeIntHours() -> Int {
        return  allTime / 3600
    }
    
    static func getTimeIntMinutes() -> Int {
        return  (allTime % 3600) / 60
    }
    
    static func getTimeIntSeconds() -> Int {
        return  (allTime % 3600) % 60
    }
}
