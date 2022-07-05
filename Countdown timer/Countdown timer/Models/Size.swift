//
//  Size.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 4.07.22.
//

import UIKit

class Size {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
    
    static let heightIphone13: CGFloat = 390.0
    static let widthIphone13: CGFloat = 844.0
    static let heightIphoneSE: CGFloat = 320.0
    static let widthIphoneSE: CGFloat = 568.0
    
    static var widthTimerCell: CGFloat = Size.getResizableWidth(65)
    
    static func getResizableHeight(_ size: CGFloat) -> CGFloat {
        return height * size / heightIphone13
    }
    
    static func getResizableWidth(_ size: CGFloat) -> CGFloat {
        if width == widthIphoneSE {
            return width * size / (widthIphone13 * CGFloat(0.8))
        } else {
            return width * size / (widthIphone13)
        }
    }
    
    static func getPaddingToSafeArea(_ size: CGFloat) -> CGFloat {
        if width == widthIphoneSE {
            return width * size * CGFloat(2.5) / (widthIphone13)
        } else {
            return width * size / (widthIphone13)
        }
    }
    
    static func getFontSize(_ size: CGFloat) -> CGFloat {
        if height == heightIphoneSE {
            return height * size / heightIphone13
        } else {
            return size
        }
    }
}

