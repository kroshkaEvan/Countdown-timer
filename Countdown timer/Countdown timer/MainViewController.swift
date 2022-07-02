//
//  ViewController.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 2.07.22.
//

import UIKit

class MainViewController: UIViewController {
    private var seconds = 86400
    private var isTimerRunning = false

    private lazy var timerStackView = TimerStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        [timerStackView].forEach { view.addSubview($0) }
        view.backgroundColor = .black
        timerStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: view.trailingAnchor,
                              padding: .init(top: 10, left: 0,
                                             bottom: 0, right: 30),
                              size: .init(width: 280, height: 41))
    }


}

