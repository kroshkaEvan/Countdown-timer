//
//  GradientButton.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

let blueButtonColor = UIColor.rgb(red: 65, green: 69, blue: 152)
let pinkButtonColor = UIColor.rgb(red: 234, green: 72, blue: 187)

class GradientButton: UIButton {
    let gradientColors : [UIColor]
    let shadowColor: UIColor
    let cornerRadius: CGFloat
    let startPoint : CGPoint
    let endPoint : CGPoint

    required init(gradientColors: [UIColor] = [blueButtonColor, pinkButtonColor],
                  shadowColor: UIColor = pinkButtonColor,
                  cornerRadius: CGFloat = 12,
                  startPoint: CGPoint = CGPoint(x: 0, y: 0),
                  endPoint: CGPoint = CGPoint(x: 0, y: 1)) {
        self.gradientColors = gradientColors
        self.shadowColor = shadowColor
        self.cornerRadius = cornerRadius
        self.startPoint = startPoint
        self.endPoint = endPoint

        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = nil
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = gradientColors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.cornerRadius = cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)

        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = cornerRadius
        layer.shadowOpacity = 3.0
        layer.cornerRadius = cornerRadius
    }
}
