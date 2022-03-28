//
//  UIColorExtension.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/28.
//

import UIKit

extension UIColor {
    
    public class func hexStringToColor(hexString: String) -> UIColor{
        return hexStringToColor(hexString: hexString, alpha: 1.0)
    }
    
    public class func hexStringToColor(hexString: String, alpha: CGFloat) -> UIColor{
        var rgbValue: UInt64 = 0
        let scanner = Scanner(string: hexString)
        scanner.scanLocation = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        return UIColor.init(red: CGFloat(r) / 0xff, green: CGFloat(g) / 0xff, blue: CGFloat(b) / 0xff, alpha: alpha)
    }
}

