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
            let animationTransition = CATransition()
            animationTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animationTransition.type = CATransitionType.push
            animationTransition.subtype = CATransitionSubtype.fromBottom
            animationTransition.duration = 0.7
            layer.add(animationTransition, forKey: CATransitionType.push.rawValue)
        }
    }
}
