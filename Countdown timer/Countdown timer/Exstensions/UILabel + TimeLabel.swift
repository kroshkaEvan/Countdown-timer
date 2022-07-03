//
//  TimeLabel.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

extension UILabel {
    
    func addTimeLabel() {
        backgroundColor = .clear
        textColor = .white
        font = UIFont.systemFont(ofSize: 15, weight: .bold)
        textAlignment = .center
    }
    
    func getTimeString(time: Int) {
            return text = String(format:"%02i", time)
        }
    
    func addCubeAnimation(time: Int) {
        if text !=  String(format: "%02i", time) {
            let animation = CATransition()
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.type = CATransitionType.push
            animation.subtype = CATransitionSubtype.fromBottom
            animation.duration = 0.7
            layer.add(animation, forKey: CATransitionType.push.rawValue)
        }
    }
}
