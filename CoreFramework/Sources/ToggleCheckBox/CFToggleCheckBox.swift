//
//  ToggleCheckBox.swift
//  CoreFramework
//
//  Created by Edgar on 08/05/25.
//

import Foundation
import UIKit

public class CFToggleCheckBox: UIButton {
    
    var checkedImage: UIImage? = nil
    var uncheckedImage: UIImage? = nil
    
    private(set) var isChecked: Bool = false {
        didSet {
            updateImage()
        }
    }
    
    public convenience init(title: String, checked: UIImage? = nil, unchecked: UIImage? = nil){
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.checkedImage = checked
        self.uncheckedImage = unchecked
        updateImage()
        configuration = Configuration.plain()
        configuration?.imagePadding = 10
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        contentHorizontalAlignment = .left
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    private func setup(){
        updateImage()
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    
    @objc
    private func toggle(){
        isChecked.toggle()
    }
    
    
    private func updateImage(){
        let image = isChecked ? checkedImage : uncheckedImage
        setImage(image, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//#Preview {
//    CFToggleCheckBox(title: "HEYAAAA")
//}
