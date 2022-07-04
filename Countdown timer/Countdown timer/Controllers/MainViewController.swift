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
        image.image = UIImage(named: "music")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var offerLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "LAST MINUTE CHANCE! \nto claim your offer",
                                                       attributes: [.font: UIFont.systemFont(ofSize: Size.getFontSize(22),
                                                                                             weight: .semibold)])
        attributedText.append(NSAttributedString(string: "\n ",
                                                 attributes: [.font: UIFont.systemFont(ofSize: Size.getProportionSizeHeight(12),
                                                                                       weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\n90% OFF",
                                                 attributes: [.font: UIFont.systemFont(ofSize: Size.getFontSize(55),
                                                                                       weight: .black)]))
        attributedText.append(NSAttributedString(string: "\n ",
                                                 attributes: [.font: UIFont.systemFont(ofSize: Size.getProportionSizeHeight(8),
                                                                                       weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\nFor true music fans",
                                                 attributes: [.font: UIFont.systemFont(ofSize: Size.getFontSize(15),
                                                                                       weight: .semibold)]))
        label.attributedText = attributedText
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 6
        return label
    }()
    
    private lazy var timerStackView = TimerStackView()
    
    private lazy var hundredsSongsLabel: UILabel = {
        let label = UILabel()
        label.text = "Hundreds of songs in your pocket"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        label.alpha = 0.9
        return label
    }()
    
    private lazy var activateButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("ACTIVATE OFFER", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    private lazy var privacyLabel: UILabel = {
        let label = UILabel()
        label.text = "Privacy    Restore    Terms"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var alertView = AlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButton.addTarget(self,
                                 action: #selector(didTapStopTimer),
                                 for: .touchUpInside)
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .black
        [appleMusicImage, offerLabel, timerStackView, hundredsSongsLabel, activateButton, privacyLabel].forEach { view.addSubview($0) }
        appleMusicImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appleMusicImage.anchor(top: nil,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               padding: .init(top: 0, left: 0,
                                              bottom: 0, right: 0),
                               size: .init(width: view.frame.width / 2,
                                           height: view.frame.height / 1.5))
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
                              padding: .init(top: Size.getProportionSizeHeight(20), left: 0,
                                             bottom: 0, right: 0),
                              size: .init(width: Size.getProportionSizeWidth(290),
                                          height: Size.getProportionSizeHeight(41)))
        hundredsSongsLabel.anchor(top: timerStackView.bottomAnchor,
                                  leading: nil,
                                  bottom: nil,
                                  trailing: nil,
                                  padding: .init(top: Size.getProportionSizeHeight(16), left: 0,
                                                 bottom: 0, right: 0))
        [timerStackView, offerLabel, hundredsSongsLabel, privacyLabel].forEach { view in
            view.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor).isActive = true
        }
        activateButton.anchor(top: hundredsSongsLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: Size.getProportionSizeHeight(10), left: 0,
                                             bottom: 0, right: Size.getPaddingToSafeArea(20)),
                              size: .init(width: Size.getProportionSizeWidth(300),
                                          height: Size.getProportionSizeHeight(63)))
        privacyLabel.anchor(top: nil,
                            leading: nil,
                            bottom: view.bottomAnchor,
                            trailing: nil,
                            padding: .init(top: 0, left: 0,
                                           bottom: Size.getProportionSizeHeight(20), right: 0))
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
        timerStackView.timer.invalidate()
        view.addSubview(alertView)
        alertView.fillSuperview()
        alertView.timeActivatedLabel.text = "Offer activated at \(self.getStopedTimeString())"
    }
}
