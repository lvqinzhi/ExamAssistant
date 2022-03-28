//
//  QRCodeView.swift
//  ExamAssistant
//
//  Created by 吕勤治 on 2022/3/28.
//

// MARK: - Reference from https://github.com/GitZhouQi/QRCode.git
import UIKit
import AVFoundation

open class QRCodeView: UIView {

    override init(frame:CGRect) {
        var frameTmp = frame
        frameTmp.origin = CGPoint.zero
        super.init(frame: frameTmp)
        backgroundColor = UIColor.clear
    }
    
    required public init?(coder: NSCoder) {
        self.init()
    }
    
    override open func draw(_ rect: CGRect) {
        drawScanRect()
    }
    
    func drawScanRect() {
        let XRectangleLeft: CGFloat = 60
        let sizeRectangle = CGSize(width: self.frame.size.width - XRectangleLeft * 2.0, height: self.frame.size.width - XRectangleLeft * 2.0)
        let YMinRectangle = self.frame.size.height / 2.0 - sizeRectangle.height / 2.0 - 44
        let YMaxRectangle = YMinRectangle + sizeRectangle.height
        let XRectangleRight = self.frame.size.width - XRectangleLeft
        
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5).cgColor)
        var rect = CGRect(x: 0, y: 0, width: self.frame.size.width, height: YMinRectangle)
        context.fill(rect)
        rect = CGRect(x: 0, y: YMinRectangle, width: XRectangleLeft, height: sizeRectangle.height)
        context.fill(rect)
        rect = CGRect(x: XRectangleRight, y: YMinRectangle, width: XRectangleLeft,height: sizeRectangle.height)
        context.fill(rect)
        rect = CGRect(x: 0, y: YMaxRectangle, width: self.frame.size.width,height: self.frame.size.height - YMaxRectangle)
        context.fill(rect)
        context.strokePath()
        
        let wAngle: CGFloat = 24.0
        let hAngle: CGFloat = 24.0
        let linewidthAngle: CGFloat = 4
        var diffAngle = linewidthAngle / 3
        diffAngle = linewidthAngle / 2
        diffAngle = linewidthAngle / 2
        diffAngle = 0
        diffAngle = -4 / 2
        
        context.setStrokeColor(UIColor.white.cgColor)
        context.setFillColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        context.setLineWidth(linewidthAngle)
        
        let leftX = XRectangleLeft - diffAngle
        let topY = YMinRectangle - diffAngle
        let rightX = XRectangleRight + diffAngle
        let bottomY = YMaxRectangle + diffAngle
        
        context.move(to: CGPoint(x: leftX-linewidthAngle / 2, y: topY))
        context.addLine(to: CGPoint(x: leftX + wAngle, y: topY))
        context.move(to: CGPoint(x: leftX, y: topY-linewidthAngle / 2))
        context.addLine(to: CGPoint(x: leftX, y: topY+hAngle))
        context.move(to: CGPoint(x: leftX-linewidthAngle / 2, y: bottomY))
        context.addLine(to: CGPoint(x: leftX + wAngle, y: bottomY))
        context.move(to: CGPoint(x: leftX, y: bottomY+linewidthAngle / 2))
        context.addLine(to: CGPoint(x: leftX, y: bottomY - hAngle))
        context.move(to: CGPoint(x: rightX+linewidthAngle / 2, y: topY))
        context.addLine(to: CGPoint(x: rightX - wAngle, y: topY))
        context.move(to: CGPoint(x: rightX, y: topY-linewidthAngle / 2))
        context.addLine(to: CGPoint(x: rightX, y: topY + hAngle))
        context.move(to: CGPoint(x: rightX+linewidthAngle / 2, y: bottomY))
        context.addLine(to: CGPoint(x: rightX - wAngle, y: bottomY))
        context.move(to: CGPoint(x: rightX, y: bottomY+linewidthAngle / 2))
        context.addLine(to: CGPoint(x: rightX, y: bottomY - hAngle))
        context.strokePath()
    }
    
}

