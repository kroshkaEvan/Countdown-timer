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
    
    private lazy var offerLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "LAST MINUTE CHANCE! \nto claim your offer",
                                                       attributes: [.font: UIFont.systemFont(ofSize: 22,
                                                                                             weight: .semibold)])
        attributedText.append(NSAttributedString(string: "\n ",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 12,
                                                                                       weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\n90% OFF",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 55,
                                                                                       weight: .black)]))
        attributedText.append(NSAttributedString(string: "\n ",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 8,
                                                                                       weight: .regular)]))
        attributedText.append(NSAttributedString(string: "\nFor true music fans",
                                                 attributes: [.font: UIFont.systemFont(ofSize: 15,
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activateButton.addTarget(self,
                                 action: #selector(didTapStop),
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
                               padding: .init(top: 0, left: 35,
                                              bottom: 0, right: 0),
                               size: .init(width: 310, height: 200))
        offerLabel.anchor(top: view.topAnchor,
                          leading: nil,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 0, left: 0,
                                         bottom: 0, right: 20))
        timerStackView.anchor(top: offerLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: nil,
                              padding: .init(top: 20, left: 0,
                                             bottom: 0, right: 0),
                              size: .init(width: 290, height: 41))
        hundredsSongsLabel.anchor(top: timerStackView.bottomAnchor,
                                  leading: nil,
                                  bottom: nil,
                                  trailing: nil,
                                  padding: .init(top: 16, left: 0,
                                                 bottom: 0, right: 20))
        [timerStackView, offerLabel, hundredsSongsLabel, privacyLabel].forEach { view in
            view.centerXAnchor.constraint(equalTo: activateButton.centerXAnchor).isActive = true
        }
        activateButton.anchor(top: hundredsSongsLabel.bottomAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: .init(top: 10, left: 0,
                                             bottom: 0, right: 20),
                              size: .init(width: 300, height: 63))
        privacyLabel.anchor(top: nil,
                            leading: nil,
                            bottom: view.bottomAnchor,
                            trailing: nil,
                            padding: .init(top: 0, left: 0,
                                           bottom: 30, right: 20))
    }
    
    @objc func didTapStop() {
        timerStackView.timer.invalidate()
    }
}

