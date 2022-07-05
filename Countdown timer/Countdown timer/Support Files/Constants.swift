//
//  Constants.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 3.07.22.
//

import UIKit

class Constants {
    
    class Color {
        static let blueButtonColor = UIColor.rgb(red: 65, green: 69, blue: 152)
        static let pinkButtonColor = UIColor.rgb(red: 234, green: 72, blue: 187)
        static let grayTimerViewColor = UIColor.rgb(red: 43, green: 43, blue: 43)
        static let blueAlertViewColor = UIColor.rgb(red: 0, green: 15, blue: 78)
    }
    
    class Font {
        static var timerFont = UIFont.systemFont(ofSize: 15,
                                                 weight: .bold)
        static var lastMinuteFont = UIFont.systemFont(ofSize: Size.getFontSize(22),
                                                      weight: .semibold)
        static var OFFfont = UIFont.systemFont(ofSize: Size.getFontSize(55),
                                               weight: .black)
        static var trueMusicFont = UIFont.systemFont(ofSize: Size.getFontSize(15),
                                                     weight: .semibold)
        static var firstPaddingFont = UIFont.systemFont(ofSize: Size.getResizableHeight(12),
                                                        weight: .regular)
        static var secondPaddingFont = UIFont.systemFont(ofSize: Size.getResizableHeight(8),
                                                         weight: .regular)
        static var numberSongsFont = UIFont.systemFont(ofSize: 14,
                                                       weight: .regular)
        static var activateButtonFont = UIFont.systemFont(ofSize: 15,
                                                          weight: .semibold)
        static var privacyLabelFont = UIFont.systemFont(ofSize: 10,
                                                        weight: .regular)
    }
    
    class Image {
        static let music = UIImage(named: "music")
        static let xMark = UIImage(systemName: "xmark")
    }
}


