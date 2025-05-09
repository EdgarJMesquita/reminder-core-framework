//
//  ViewController.swift
//  Example
//
//  Created by Edgar on 18/04/25.
//

import UIKit
import CoreFramework

class MenuVC: UIViewController {
    private let contentView: MenuView;

    init(contentView: MenuView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        contentView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension MenuVC: MenuViewDelegate {
    func didTapOnboardingButton() {
        let onboardingView = CFOnboardingView()
        let steps = [
        (.onboarding,"Bem Vindo ao onboarding do Reminder"),
        (UIImage(named: "image2"),"Para cadastrar seus remédios é super simples"),
        (UIImage(named: "image3"),"Selecione o horário da primeira dose, e as subsequentes"),
        (UIImage(named: "image4"),"Iremos te lembrar de tomar no horário correto."),
        ]
        onboardingView.presentOnboarding(on: self.view, with: steps)
    }
}



#Preview {
    MenuVC(contentView: MenuView())
}
