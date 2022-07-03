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
    
    private var allTime = 86400
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
    
    private func getInt(time: Int) -> (Int, Int, Int, Int) {
        return  (time / (3600 * 24),
                (time / 3600),
                (time % 3600) / 60,
                (time % 3600) % 60)
    }
        
    @objc func run() {
        if allTime < 1 {
            timer.invalidate()
        } else {
            allTime -= 1
            let timeInterval = getInt(time: allTime)
            
            dayLabel.addCubeAnimation(time: timeInterval.0)
            hourLabel.addCubeAnimation(time: timeInterval.1)
            minuteLabel.addCubeAnimation(time: timeInterval.2)
            secondLabel.addCubeAnimation(time: timeInterval.3)

            dayLabel.getTimeString(time: timeInterval.0)
            hourLabel.getTimeString(time: timeInterval.1)
            minuteLabel.getTimeString(time: timeInterval.2)
            secondLabel.getTimeString(time: timeInterval.3)
        }
    }
}


