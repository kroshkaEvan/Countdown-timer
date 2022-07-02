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
    
    func getTimeString(time: TimeInterval,
                       timeFormat: TimeFormat) {
        switch timeFormat {
        case .day:
            return text = String(format:"%02i", Int(time) / 86400)
        case .hour:
            return text = String(format:"%02i", Int(time) / 3600)
        case .minute:
            return text = String(format:"%02i", Int(time) / 60 % 60)
        case .second:
            return text = String(format:"%02i", Int(time) % 60)
        }
    }
    
    func addCubeAnimation(direction: AnimationDirection) {
        let cubeLabel = UILabel(frame: frame)
        cubeLabel.text = text
        cubeLabel.font = font
        cubeLabel.textAlignment = textAlignment
        cubeLabel.textColor = textColor
        cubeLabel.backgroundColor = backgroundColor
        
        let auxLabelOffset = CGFloat(direction.rawValue) *
        frame.size.height/2.0
        
        cubeLabel.transform = CGAffineTransform(translationX: 0.0,
                                                y: auxLabelOffset)
            .scaledBy(x: 1.0, y: 0.1)
        
        superview?.addSubview(cubeLabel)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: { [weak self] in
            cubeLabel.transform = .identity
            self?.transform = CGAffineTransform(translationX: 0.0,
                                                y: -auxLabelOffset)
                .scaledBy(x: 1.0, y: 0.1)
            
        },completion: { [weak self] _ in
            self?.transform = .identity
            self?.text = cubeLabel.text
            cubeLabel.removeFromSuperview()
        })
    }
}
