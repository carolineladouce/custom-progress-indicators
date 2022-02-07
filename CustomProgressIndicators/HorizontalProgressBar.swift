//
//  HorizontalProgressBar.swift
//  CustomProgressIndicators
//
//  Created by Caroline LaDouce on 2/4/22.
//

import UIKit

class HorizontalProgressBar: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    let baseBarWidth: CGFloat = 300
    let baseBarHeight: CGFloat = 50
    let baseColor: UIColor = .lightGray
    let fillColor: UIColor = .systemPurple
    var progress: CGFloat = 0.5
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(baseColor.cgColor)
        context.fill(bounds)
        
        
        // Draw base rect
        let baseRect = CGRect(x: 0, y: 0, width: baseBarWidth, height: baseBarHeight)
        let barMask = CAShapeLayer()
        barMask.path = UIBezierPath(roundedRect: baseRect, cornerRadius: baseRect.height * 0.25).cgPath
        layer.mask = barMask
        
        let progressFillRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: baseBarWidth * progress, height: baseBarHeight))
        let progressFillLayer = CALayer()
        progressFillLayer.frame = progressFillRect
        
        layer.addSublayer(progressFillLayer)
        progressFillLayer.backgroundColor = fillColor.cgColor
        
        context.restoreGState()
        
    }
    
    
}
