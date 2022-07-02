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
        label.backgroundColor = .darkGray
        label.text = "01"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .darkGray
        label.text = "00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var minuteLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .darkGray
        label.text = "00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .darkGray
        label.text = "00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelSubviews = [dayLabel, hourLabel, minuteLabel, secondLabel].map { (label) -> UIView in
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 41).isActive = true
        view.layer.masksToBounds = true
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.addSubview(label)
        label.centerInSuperview(size: .init(width: 55, height: 38))
        return view
    }
    
    private lazy var colonLabel: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .white
        return label
    }()
    
    private lazy var colonLabel2: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .white
        return label
    }()
    
    private lazy var colonLabel3: UILabel = {
        let label = UILabel()
        label.text = ":"
        label.textColor = .white
        return label
    }()
    
    lazy var timer: Timer = {
        let timer = Timer()
        return timer
    }()
    
    private var seconds = 86400
    private var isTimerRunning = false
    private var index = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        startTimer()
        setupStackViewLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackViewLayout() {
        labelSubviews.forEach { view in
            addArrangedSubview(view)
        }
        
        [colonLabel, colonLabel2, colonLabel3].forEach { view in
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
        if seconds < 1 {
            timer.invalidate()
        } else {
            seconds -= 1
            let timeInterval = TimeInterval(seconds)
            dayLabel.text = getTimeString(time: timeInterval,
                                          timeFormat: .day)
            hourLabel.text = getTimeString(time: timeInterval,
                                          timeFormat: .hour)
            minuteLabel.text = getTimeString(time: timeInterval,
                                          timeFormat: .minute)
            secondLabel.text = getTimeString(time: timeInterval,
                                          timeFormat: .second)
        }
    }
    
    private func getTimeString(time: TimeInterval,
                               timeFormat: TimeFormat) -> String {
        switch timeFormat {
        case .day:
            return String(format:"%02i", Int(time) / 86400)
        case .hour:
            return String(format:"%02i", Int(time) / 3600)
        case .minute:
            return String(format:"%02i", Int(time) / 60 % 60)
        case .second:
            return String(format:"%02i", Int(time) % 60)
        }
    }
}


