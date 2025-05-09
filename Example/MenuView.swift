//
//  MenuView.swift
//  Example
//
//  Created by Edgar on 19/04/25.
//

import Foundation
import UIKit
import CoreFramework

class MenuView: UIView {
    weak var delegate: MenuViewDelegate?
 
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Example Menu"
        label.font = CFTypography.heading
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var onboardingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Onboarding", for: .normal)
        button.layer.cornerRadius = CFMetrics.medium
        button.backgroundColor = CFColors.primaryRedBase
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var checkBox: CFToggleCheckBox = {
        let button = CFToggleCheckBox(title: "Hello world")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var primaryButton: CFButton = {
        let button = CFButton(title: "Hello world")
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy(){
        addSubview(titleLabel)
        addSubview(onboardingButton)
        addSubview(checkBox)
        addSubview(primaryButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CFMetrics.huge),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            onboardingButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            onboardingButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            onboardingButton.heightAnchor.constraint(equalToConstant: CFMetrics.buttonSize),
            onboardingButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            checkBox.topAnchor.constraint(equalTo: onboardingButton.bottomAnchor, constant: CFMetrics.medium),
            checkBox.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            primaryButton.topAnchor.constraint(equalTo: checkBox.bottomAnchor),
            primaryButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            primaryButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupAction(){
        onboardingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapButton(){
        delegate?.didTapOnboardingButton()
    }
    
}


protocol MenuViewDelegate: AnyObject {
    func didTapOnboardingButton()
}

#Preview {
    MenuVC(contentView: MenuView())
}
