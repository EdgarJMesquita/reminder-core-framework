//
//  OnboardingView.swift
//  CoreFramework
//
//  Created by Edgar Jonas Mesquita da Silva on 08/03/25.
//

import Foundation
import UIKit

public class CFOnboardingView: UIView {
    
    private var steps: [(image: UIImage?, text: String)] = []
    private var currentStep = 0
    
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = CFColors.gray100.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = CFColors.gray700
        label.font = CFTypography.heading
        label.numberOfLines = 0
        label.textAlignment = .center
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Próximo", for: .normal)
        button.titleLabel?.font = CFTypography.subHeading
        button.setTitleColor(CFColors.primaryRedBase, for: .normal)
       
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    public init() {
        super.init(frame: .zero)
        setupUI()
        bindAction()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindAction(){
        nextButton.addTarget(self, action: #selector(didTapNextStep), for: .touchUpInside)
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
    
    
    public func presentOnboarding(on view: UIView, with steps: [(image: UIImage?, text: String)]){
        self.steps = steps
        self.currentStep = 0
        
        updateStep(animated: true)
        
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    private func updateStep(animated: Bool = false){
        let step = steps[currentStep]
        imageView.image = step.image
        messageLabel.text = step.text
        
        if animated {
            animateTextEntry()
        } else {
            messageLabel.alpha = 1
            messageLabel.transform = .identity
        }
        
        //        UIView.transition(
//            with: messageLabel,
//            duration: 0.5,
//            options: .transitionCrossDissolve,
//            animations: { [weak self] in
//                guard let self else { return }
//                messageLabel.text = steps[currentStep].text
//             },
//            completion: nil
//        )
    }
    
    private func animateTextEntry(){
        messageLabel.alpha = 0
        messageLabel.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.curveEaseOut]
        ){ [weak self] in
            guard let self else {
                return
            }
            messageLabel.alpha = 1
            messageLabel.transform = .identity
        }
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
        addSubview(imageView)
    }
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CFMetrics.medium),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: CFMetrics.medium),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -CFMetrics.medium),

            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CFMetrics.medium),
            nextButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
    
}

//#Preview{
//    let vc = UIViewController()
//    let onboarding = CFOnboardingView()
//    onboarding.bounds = vc.view.bounds
//    let steps = [
//    (UIImage(named: "image1"),"Bem Vindo ao onboarding do Reminder"),
//    (UIImage(named: "image2"),"Para cadastrar seus remédios é super simples"),
//    (UIImage(named: "image3"),"Selecione o horário da primeira dose, e as subsequentes"),
//    (UIImage(named: "image4"),"Iremos te lembrar de tomar no horário correto."),
//    ]
//    onboarding.presentOnboarding(on: vc.view, with: steps)
//    return vc
//}
