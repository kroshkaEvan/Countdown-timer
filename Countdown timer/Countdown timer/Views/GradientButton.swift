//
//  GradientButton.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

class GradientButton: UIButton {
    let gradientColors: [UIColor]
    let shadowColor: UIColor
    let cornerRadius: CGFloat
    let startPoint: CGPoint
    let endPoint: CGPoint
    
    required init(gradientColors: [UIColor] = [Constants.Color.blueButtonColor,
                                               Constants.Color.pinkButtonColor],
                  shadowColor: UIColor = Constants.Color.pinkButtonColor,
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
        layer.shadowOpacity = 2.0
        layer.cornerRadius = cornerRadius
    }
    
    override var isHighlighted: Bool {
        didSet {
            let xScale : CGFloat = isHighlighted ? 0.925 : 1.0
            let yScale : CGFloat = isHighlighted ? 0.95 : 1.0
            UIView.animate(withDuration: 0.1) {
                let transformation = CGAffineTransform(scaleX: xScale,
                                                       y: yScale)
                self.transform = transformation
            }
        }
    }
}
