//
//  ViewController.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var appleMusicImage: UIImageView = {
        let image = UIImageView()
        image.image = Constants.Image.music
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var crossButton: UIButton = {
        var button = UIButton()
        button.setImage(Constants.Image.xMark,
                        for: .normal)
        button.imageView?.tintColor = .darkGray
        return button
    }()
    
    private lazy var offerLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "LAST-MINUTE CHANCE! \nto claim your offer",
                                                       attributes: [.font: Constants.Font.lastMinuteFont])
        attributedText.append(NSAttributedString(string: "\n ",
                                                 attributes: [.font: Constants.Font.firstPaddingFont]))
        attributedText.append(NSAttributedString(string: "\n90% OFF",
                                                 attributes: [.font: Constants.Font.OFFfont]))
        attributedText.append(NSAttributedString(string: "\n ",
                                                 attributes: [.font: Constants.Font.secondPaddingFont]))
        attributedText.append(NSAttributedString(string: "\nFor true music fans",
                                                 attributes: [.font: Constants.Font.trueMusicFont]))
        label.attributedText = attributedText
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 6
        return label
    }()
    
    private lazy var timerStackView = TimerStackView()
    
    private lazy var numberSongsLabel: UILabel = {
        let label = UILabel()
        label.text = "Hundreds of songs in your pocket"
        label.font = Constants.Font.numberSongsFont
        label.textColor = .lightGray
        label.alpha = 0.9
        return label
    }()
    
    private lazy var activateButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("ACTIVATE OFFER", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Constants.Font.activateButtonFont
        return button
    }()
    
    private lazy var privacyLabel: UILabel = {
        let label = UILabel()
        label.text = "Privacy    Restore    Terms"
        label.font = Constants.Font.privacyLabelFont
        label.textColor = .lightGray
        label.alpha = 0.9
        return label
    }()
    
    private lazy var alertView = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButton.addTarget(self,
                                 action: #selector(didTapStopTimer),
                                 for: .touchUpInside)
        checkDevice()
    }
    
    private func checkDevice() {
        Device.shared.iPads.forEach { (iPad) in
            Device.shared.iPhones.forEach { (iPhone) in
                if iPad == UIDevice.current.name {
                    setupLayoutForIPad()
                } else if iPhone == UIDevice.current.name {
                    setupLayoutForIPhone()
                } else { return }
            }
        }
    }
    
    private func setupLayoutForIPhone() {
        view.backgroundColor = .black
        [appleMusicImage, crossButton, offerLabel, timerStackView,
         numberSongsLabel, activateButton, privacyLabel].forEach { view.addSubview($0) }
        
        appleMusicImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appleMusicImage.anchor(top: nil,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               padding: .init(top: 0, left: 0,
                                              bottom: 0, right: 0),
                               size: .init(width: view.frame.width / 2,
                                           height: view.frame.height / 1.5))
        crossButton.anchor(top: view.topAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               padding: .init(top: 10, left: 10,
                                              bottom: 0, right: 0),
                               size: .init(width: 41,
                                           height: 41))
        offerLabel.anchor(top: view.topAnchor,
                          leading: nil,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 0, left: 0,
                                         bottom: 0, right: 0))
        timerStackView.anchor(top: offerLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: nil,
                              padding: .init(top: Size.getResizableHeight(20), left: 0,
                                             bottom: 0, right: 0),
                              size: .init(width: Size.getResizableWidth(290),
                                          height: Size.getResizableHeight(41)))
        numberSongsLabel.anchor(top: timerStackView.bottomAnchor,
                                  leading: nil,
                                  bottom: nil,
                                  trailing: nil,
                                  padding: .init(top: Size.getResizableHeight(16), left: 0,
                                                 bottom: 0, right: 0))
        [timerStackView, offerLabel, numberSongsLabel, privacyLabel].forEach { view in
            view.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor).isActive = true
        }
        activateButton.anchor(top: numberSongsLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: Size.getResizableHeight(10), left: 0,
                                             bottom: 0, right: Size.getPaddingToSafeArea(20)),
                              size: .init(width: Size.getResizableWidth(300),
                                          height: Size.getResizableHeight(63)))
        privacyLabel.anchor(top: nil,
                            leading: nil,
                            bottom: view.bottomAnchor,
                            trailing: nil,
                            padding: .init(top: 0, left: 0,
                                           bottom: Size.getResizableHeight(30), right: 0))
    }
    
    private func setupLayoutForIPad() {
        setFontsForIPad()
        Size.widthTimerCell = CGFloat(85)
        view.backgroundColor = .black
        [appleMusicImage, crossButton, offerLabel, timerStackView,
         numberSongsLabel, activateButton, privacyLabel].forEach { view.addSubview($0) }
        appleMusicImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appleMusicImage.anchor(top: nil,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               padding: .init(top: 0, left: 0,
                                              bottom: 0, right: 0),
                               size: .init(width: view.frame.width / 2,
                                           height: view.frame.height / 1.5))
        crossButton.anchor(top: view.topAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               padding: .init(top: 10, left: 10,
                                              bottom: 0, right: 0),
                               size: .init(width: 41,
                                           height: 41))
        offerLabel.anchor(top: nil,
                          leading: nil,
                          bottom: appleMusicImage.centerYAnchor,
                          trailing: nil,
                          padding: .init(top: 0, left: 0,
                                         bottom: 35, right: 0))
        timerStackView.anchor(top: appleMusicImage.centerYAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: nil,
                              padding: .init(top: -10, left: 0,
                                             bottom: 0, right: 0),
                              size: .init(width: 400,
                                          height: 57))
        numberSongsLabel.anchor(top: timerStackView.bottomAnchor,
                                  leading: nil,
                                  bottom: nil,
                                  trailing: nil,
                                  padding: .init(top: 45, left: 0,
                                                 bottom: 0, right: 0))
        [timerStackView, offerLabel, numberSongsLabel, privacyLabel].forEach { view in
            view.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor).isActive = true
        }
        activateButton.anchor(top: numberSongsLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: 30, left: 0,
                                             bottom: 0, right: 95),
                              size: .init(width: 403,
                                          height: 88))
        privacyLabel.anchor(top: activateButton.bottomAnchor,
                            leading: nil,
                            bottom: nil,
                            trailing: nil,
                            padding: .init(top: 20, left: 0,
                                           bottom: 0, right: 0))
    }
    
    private func setFontsForIPad() {
        Constants.Font.lastMinuteFont = UIFont.systemFont(ofSize: 35,
                                                          weight: .semibold)
        Constants.Font.firstPaddingFont = UIFont.systemFont(ofSize: 18,
                                                            weight: .regular)
        Constants.Font.OFFfont = UIFont.systemFont(ofSize: 80,
                                                   weight: .black)
        Constants.Font.secondPaddingFont = UIFont.systemFont(ofSize: 14,
                                                             weight: .regular)
        Constants.Font.trueMusicFont = UIFont.systemFont(ofSize: 20,
                                                         weight: .semibold)
        Constants.Font.numberSongsFont = UIFont.systemFont(ofSize: 18,
                                                           weight: .regular)
        Constants.Font.activateButtonFont = UIFont.systemFont(ofSize: 20,
                                                              weight: .semibold)
        Constants.Font.privacyLabelFont = UIFont.systemFont(ofSize: 14,
                                                            weight: .regular)
        Constants.Font.timerFont = UIFont.systemFont(ofSize: 23,
                                                     weight: .bold)
    }

    private func getStopedTimeString() -> String {
        let zeroLabel = "00"
        let colonLabel = ":"
        var timeLabel = ""
        if timerStackView.dayLabel.text != zeroLabel {
            timeLabel += "01:00:00:00"
        } else {
            if let hourLabel = timerStackView.hourLabel.text,
               let minuteLabel = timerStackView.minuteLabel.text,
               let secondLabel = timerStackView.secondLabel.text {
                guard hourLabel == zeroLabel else
                { timeLabel += hourLabel + colonLabel + minuteLabel + colonLabel + secondLabel;
                    return timeLabel }
                guard minuteLabel == zeroLabel else
                { timeLabel += minuteLabel + colonLabel + secondLabel;
                    return timeLabel }
                guard secondLabel == zeroLabel else
                { timeLabel += secondLabel;
                    return timeLabel }
            }}
        return timeLabel
    }
    
    @objc func didTapStopTimer() {
        timerStackView.stopTimer()
        view.addSubview(alertView)
        alertView.fillSuperview()
        alertView.timeActivatedLabel.text = "Offer activated at \(self.getStopedTimeString())"
    }
}
