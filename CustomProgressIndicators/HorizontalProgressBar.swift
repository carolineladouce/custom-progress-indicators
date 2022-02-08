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
    
    let gradientLayer = CAGradientLayer()
    
    
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
        
        // Draw progress fill
        let progressFillRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: baseBarWidth * progress, height: baseBarHeight))
        
        let progressFillLayer = CALayer()
        progressFillLayer.frame = progressFillRect
        layer.addSublayer(progressFillLayer)
        progressFillLayer.backgroundColor = fillColor.cgColor
        
        // Draw gradient
        gradientLayer.frame = baseRect
        gradientLayer.mask = progressFillLayer
        gradientLayer.locations = [0.35, 0.5, 0.65]
        gradientLayer.colors = [fillColor.cgColor, UIColor.white.cgColor, fillColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: progress, y: 0.5)
        
        layer.addSublayer(gradientLayer)
        
        
        context.restoreGState()
        
    }
    
    
    func createGradientAnimation() {
           let gradientFlowAnimation = CABasicAnimation(keyPath: "locations")
           gradientFlowAnimation.fromValue = [-0.3, -0.15, 0]
           gradientFlowAnimation.toValue = [1, 1.15, 1.3]
           
           gradientFlowAnimation.isRemovedOnCompletion = false
           gradientFlowAnimation.repeatCount = Float.infinity
           gradientFlowAnimation.duration = 1
           
           gradientLayer.add(gradientFlowAnimation, forKey: "flowAnimation")
       }
    
}
