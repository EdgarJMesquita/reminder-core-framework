//
//  CFButton.swift
//  CoreFramework
//
//  Created by Edgar on 09/05/25.
//

import Foundation
import UIKit

public class CFButton: UIButton {
    
    weak var delegate: CFButtonDelegate?
    private var iconPosition: NSDirectionalRectEdge?
    private var customWidth: CGFloat?
   
    
    public init(
        title: String,
        backgroundColor: UIColor = CFColors.primaryRedBase
    ){
        super.init(frame: .zero)
        setup(
            title: title,
            icon: nil,
            backgroundColor: backgroundColor
        )
    }
    
    
    public init(
        title: String,
        icon: UIImage,
        iconPosition: NSDirectionalRectEdge,
        backgroundColor: UIColor = CFColors.primaryRedBase
    ) {
        super.init(frame: .zero)
        setup(
            title: title,
            icon: icon,
            iconPosition: iconPosition,
            backgroundColor: backgroundColor
        )
    }
    
    
    private func setup(
        title: String,
        icon: UIImage?,
        iconPosition: NSDirectionalRectEdge = .leading,
        backgroundColor: UIColor
    ){
        
        var configuration = UIButton.Configuration.filled()
    
        configuration.baseBackgroundColor = backgroundColor
        configuration.cornerStyle = .capsule
        configuration.buttonSize = .large
        
        configuration.imagePadding = 10
        configuration.image = icon
        configuration.imagePlacement = iconPosition
        
        configuration.attributedTitle = AttributedString(
            title,
            attributes: AttributeContainer([
                    NSAttributedString.Key.font: CFTypography.subHeading
            ])
        )
        
        self.configuration = configuration
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(
            self,
            action: #selector(buttonAction),
            for: .touchUpInside
        )
    }
  
    
    @objc
    private func buttonAction(){
        delegate?.buttonAction()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


public protocol CFButtonDelegate: AnyObject {
    func buttonAction()
}


//#Preview {
//    CFButton(title: "HEYAAAA")
//}
