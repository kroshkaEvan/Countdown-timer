//
//  UIColor.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
