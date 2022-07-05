//
//  AlertView.swift
//  Countdown timer
//
//  Created by Эван Крошкин on 3.07.22.
//

import UIKit

class AlertView: UIView {
    
    // MARK: - Private Properties
    
    private lazy var activatedView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Color.blueAlertViewColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var greatLabel: UILabel = {
        let label = UILabel()
        label.text = "Great!"
        label.addShadow(font: .systemFont(ofSize: 34,
                                          weight: .semibold),
                        shadowBlurRadius: 15,
                        shadowColor: .blue,
                        foregroundColor: .white)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Public Properties
    
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.65
        return blurEffectView
    }()
    
    lazy var timeActivatedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(frame: .zero)
        setupViewLayout()
    }
    
    // MARK: - Private Methods
    
    private func setupViewLayout() {
        self.addSubview(blurEffectView)
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        blurEffectView.frame = bounds
        insertSubview(blurEffectView, at: 0)
        addSubview(activatedView)
        blurEffectView.fillSuperview()
        activatedView.centerInSuperview(size: .init(width: 300,
                                                    height: 150))
        [greatLabel, timeActivatedLabel].forEach { activatedView.addSubview($0) }
        greatLabel.topAnchor.constraint(equalTo: activatedView.topAnchor,
                                        constant: 30).isActive = true
        timeActivatedLabel.bottomAnchor.constraint(equalTo: activatedView.bottomAnchor,
                                                   constant: -40).isActive = true
        [greatLabel, timeActivatedLabel].forEach { label in
            label.centerXAnchor.constraint(equalTo: activatedView.centerXAnchor).isActive = true
        }
    }
}
