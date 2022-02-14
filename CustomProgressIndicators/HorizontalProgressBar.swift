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
    var baseColor: UIColor = .lightGray
    var gradientColor: UIColor = .systemPurple
    var gradientWhite: UIColor = .white
    
    public var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }
    
    var progressLayer = CALayer()
    var gradientLayer = CAGradientLayer()
    var backgroundMask = CAShapeLayer()
    
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(baseColor.cgColor)
        context.fill(bounds)
        
        let rect = CGRect(x: 0, y: 0, width: baseBarWidth, height: baseBarHeight)
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.25).cgPath
        layer.mask = backgroundMask
        
        let progressRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: rect.width * (progress / 10), height: rect.height))
        
        progressLayer.frame = progressRect
        progressLayer.backgroundColor = UIColor.systemPink.cgColor
        layer.addSublayer(progressLayer)
        
        gradientLayer.frame = rect
        gradientLayer.colors = [gradientColor.cgColor, gradientWhite.cgColor, gradientColor.cgColor]
        gradientLayer.endPoint = CGPoint(x: progress / 10, y: 0.5)
        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.35, 0.5, 0.65]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.addSublayer(gradientLayer)
        
        context.restoreGState()
    }
    
    
    func createAnimation() {
        let flowAnimation = CABasicAnimation(keyPath: "locations")
        flowAnimation.fromValue = [-0.3, -0.15, 0]
        flowAnimation.toValue = [1, 1.15, 1.3]
        
        flowAnimation.isRemovedOnCompletion = false
        flowAnimation.repeatCount = Float.infinity
        flowAnimation.duration = 1
        
        gradientLayer.add(flowAnimation, forKey: "flowAnimation")
    }
    
}
