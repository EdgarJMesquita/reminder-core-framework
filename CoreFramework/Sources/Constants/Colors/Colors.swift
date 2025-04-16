//
//  Colors.swift
//  CoreFramework
//
//  Created by Edgar Jonas Mesquita da Silva on 08/03/25.
//

import Foundation
import UIKit

public struct CFColors {
    public static let primaryRedBase = UIColor(hex: 0xC02636)
    public static let secondaryRedLight = UIColor(hex: 0xEB3C4D)
    public static let blueBase = UIColor(hex: 0x334FDC)
    public static let blueLight = UIColor(hex: 0x6E83EC)
    
    public static let gray100 = UIColor(hex: 0x17222B)
    public static let gray200 = UIColor(hex: 0x293C4C)
    public static let gray300 = UIColor(hex: 0x4D708F)
    public static let gray400 = UIColor(hex: 0xA2B9CD)
    public static let gray500 = UIColor(hex: 0xCAD7E2)
    public static let gray600 = UIColor(hex: 0xD7E1EA)
    public static let gray700 = UIColor(hex: 0xE8EEF3)
    public static let gray800 = UIColor(hex: 0xF8FAFB)
}


extension UIColor {
    public convenience init(red: Int, green:Int, blue:Int){
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    public convenience init(hex: Int){
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF
        )
    }
}
