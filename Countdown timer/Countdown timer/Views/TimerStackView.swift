//
//  TimerStackView.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

class TimerStackView: UIStackView {
    
    // MARK: - Public Properties
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "01"
        label.addTimeLabel()
        return label
    }()
    
    lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.addTimeLabel()
        return label
    }()
    
    lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.addTimeLabel()
        return label
    }()
    
    lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.addTimeLabel()
        return label
    }()
    
    lazy var timer: Timer = {
        let timer = Timer()
        return timer
    }()
    
    // MARK: - Private Properties
    
    private lazy var labelSubviews = [dayLabel, hourLabel, minuteLabel, secondLabel].map { (label) -> UIView in
        let view = UIView()
        view.backgroundColor = Constants.Color.grayTimerViewColor
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.widthAnchor.constraint(equalToConstant: Size.widthTimerCell).isActive = true
        view.addSubview(label)
        label.centerInSuperview(size: .init(width: 55, height: 38))
        return view
    }
    
    private lazy var firstColonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.addTimeLabel()
        return label
    }()
    
    private lazy var secondColonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.addTimeLabel()
        return label
    }()
    
    private lazy var thirdColonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.addTimeLabel()
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        startTimer()
        checkAppStatus(true)
        setupStackViewLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupStackViewLayout() {
        var index = 1
        
        labelSubviews.forEach { view in
            addArrangedSubview(view)
        }
        
        [firstColonLabel, secondColonLabel, thirdColonLabel].forEach { view in
            insertArrangedSubview(view, at: index)
            index += 2
        }
        distribution = .equalSpacing
    }
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: (#selector(runTime)),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    // MARK: - Public Methods
    
    func stopTimer() {
        timer.invalidate()
    }
    
    @objc func runTime() {
        if TimerTime.allTime < 1 {
            timer.invalidate()
        } else {
            TimerTime.startTimer()
            
            dayLabel.addCubeAnimation(time: TimerTime.getTimeIntDay())
            hourLabel.addCubeAnimation(time: TimerTime.getTimeIntHours())
            minuteLabel.addCubeAnimation(time: TimerTime.getTimeIntMinutes())
            secondLabel.addCubeAnimation(time: TimerTime.getTimeIntSeconds())
            
            dayLabel.getTimeString(time: TimerTime.getTimeIntDay())
            hourLabel.getTimeString(time: TimerTime.getTimeIntHours())
            minuteLabel.getTimeString(time: TimerTime.getTimeIntMinutes())
            secondLabel.getTimeString(time: TimerTime.getTimeIntSeconds())
        }
    }
    
    func checkAppStatus(_ isCheck: Bool) {
        let notificationCenter = NotificationCenter.default
        if isCheck == true {
            notificationCenter.addObserver(self,
                                           selector: #selector(backgroundStatus(_:)),
                                           name: UIApplication.didEnterBackgroundNotification,
                                           object: nil)
            notificationCenter.addObserver(self,
                                           selector: #selector(foregroundStatus(_:)),
                                           name: UIApplication.willEnterForegroundNotification,
                                           object: nil)
        } else {
            notificationCenter.removeObserver(self)
        }
    }
    
    @objc private func foregroundStatus(_ notification: NotificationCenter) {
        startTimer()
    }
    
    @objc private func backgroundStatus(_ notification: NotificationCenter) {
        stopTimer()
    }
}


