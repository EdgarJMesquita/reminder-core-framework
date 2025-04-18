//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Edgar Jonas Mesquita da Silva on 08/03/25.
//

import Foundation
import UIKit

public class CFOnboardingView: UIView {
    
    private var steps: [String] = []
    private var currentStep = 0
    
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = CFColors.gray100.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = CFColors.gray300
        label.font = CFTypography.heading
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Próximo", for: .normal)
        button.titleLabel?.font = CFTypography.subHeading
        button.setTitleColor(CFColors.primaryRedBase, for: .normal)
        button.addTarget(self, action: #selector(didTapNextStep), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    public init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc
    private func didTapNextStep(){
        currentStep += 1
        
        if(currentStep < steps.count){
            updateStep()
        } else {
            dismiss()
        }
        
    }
    
    
    public func presentOnboarding(on view: UIView, with steps: [String]){
        self.steps = steps
        self.currentStep = 0
        
        updateStep()
        
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    private func updateStep(){
        UIView.transition(
            with: messageLabel,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                guard let self else { return }
                messageLabel.text = steps[currentStep]
             },
            completion: nil
        )
    }
    
    
    private func dismiss(){
        removeFromSuperview()
    }
    
    
    private func setupUI(){
        setupHierarchy()
        setupConstraints()
    }
    
    
    private func setupHierarchy(){
        addSubview(backgroundView)
        addSubview(messageLabel)
        addSubview(nextButton)
    }
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CFMetrics.medium),
            nextButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
    
}
