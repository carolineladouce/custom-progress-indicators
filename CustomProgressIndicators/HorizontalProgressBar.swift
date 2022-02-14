//
//  HorizontalProgressBar.swift
//  CustomProgressIndicators
//
//  Created by Caroline LaDouce on 2/4/22.
//

import UIKit

class HorizontalProgressBar: UIView {

    let baseBarWidth: CGFloat = 300
    let baseBarHeight: CGFloat = 50
    let baseColor: UIColor = .lightGray
    let fillColor: UIColor = .systemPurple
    var progress: CGFloat = 50
    
    var progressFillLayer = CALayer()
    let gradientLayer = CAGradientLayer()
    var progressFillWidth: CGFloat = 150
    
    
    override func draw(_ rect: CGRect) {
        
//        progressFillWidth = baseBarWidth
        
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
        let progressFillRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: progressFillWidth, height: baseBarHeight))
        
//        let progressFillLayer = CALayer()
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
    
    
    func progressChange() {
//        progressFillWidth = baseBarWidth
        let animation = CABasicAnimation(keyPath: "progressFillWidth")
        animation.fromValue = 0
        animation.toValue = progressFillWidth
        animation.isRemovedOnCompletion = false
        animation.repeatCount = Float.infinity
        animation.duration = 1
        progressFillLayer.add(animation, forKey: "flowAnimation")
    }
    
    
//    func progressChange() {
//        let progressAnimation = CABasicAnimation()
//        progressAnimation.fromValue = 0
//        progressAnimation.toValue = progress
//        progressAnimation.isRemovedOnCompletion = false
//        progressAnimation.repeatCount = Float.infinity
//        progressAnimation.duration = 1
//        
//        progressFillLayer.add(progressAnimation, forKey: "flowAnimation")
//        
//        
//        
//    }
    
    
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
