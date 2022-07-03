//
//  TimerStackView.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

class TimerStackView: UIStackView {
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "01"
        label.addTimeLabel()
        return label
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.addTimeLabel()
        return label
    }()
    
    private lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.addTimeLabel()
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.addTimeLabel()
        return label
    }()
    
    private lazy var labelSubviews = [dayLabel, hourLabel, minuteLabel, secondLabel].map { (label) -> UIView in
        let view = UIView()
        view.backgroundColor = Constants.Color.grayTimerViewColor
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 41).isActive = true
        view.layer.masksToBounds = true
        view.widthAnchor.constraint(equalToConstant: 65).isActive = true
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
    
    lazy var timer: Timer = {
        let timer = Timer()
        return timer
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        startTimer()
        setupStackViewLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
                                          selector: (#selector(run)),
                                          userInfo: nil,
                                          repeats: true)
    }
        
    @objc func run() {
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
}


