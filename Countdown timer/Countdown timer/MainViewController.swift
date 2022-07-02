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
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var activateButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("ACTIVATE OFFER", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return button
    }()

    private lazy var timerStackView = TimerStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButton.addTarget(self,
                                 action: #selector(didTapStop),
                                 for: .touchUpInside)
        setupLayout()
    }
    
    private func setupLayout() {
        [timerStackView, activateButton, appleMusicImage].forEach { view.addSubview($0) }
        view.backgroundColor = .black
        timerStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: 10, left: 0,
                                             bottom: 0, right: 30),
                              size: .init(width: 280, height: 41))
        activateButton.anchor(top: timerStackView.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: 100, left: 0,
                                             bottom: 0, right: 20),
                              size: .init(width: 300, height: 63))
        appleMusicImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appleMusicImage.anchor(top: nil,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               padding: .init(top: 0, left: 20,
                                              bottom: 0, right: 30),
                               size: .init(width: 300, height: 170))
    }
    
    @objc func didTapStop() {
        timerStackView.timer.invalidate()
    }
}

