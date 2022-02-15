//
//  CircularProgressIndicator.swift
//  CustomProgressIndicators
//
//  Created by Caroline LaDouce on 2/4/22.
//

import UIKit

class CircularProgressIndicator: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    let baseCircleWidth: CGFloat = 300
    let baseCircleHeight: CGFloat = 300
    let strokeColor: UIColor = .systemPurple
    
    var progress: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }
    
    var progressLayer = CAShapeLayer()
    var backgroundMask = CAShapeLayer()
    let gradientLayer = CAGradientLayer()
    
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.lightGray.cgColor)
        context.fill(bounds)
        
        let baseRect = CGRect(x: 0, y: 0, width: baseCircleWidth, height: baseCircleHeight)
        
        // Draw base circle layer mask
        let backgroundMask = CAShapeLayer()
        let baseCirclePath = UIBezierPath(ovalIn: baseRect.insetBy(dx: 50, dy: 50))
        
        backgroundMask.path = baseCirclePath.cgPath
        backgroundMask.lineWidth = 50
        backgroundMask.strokeColor = UIColor.black.cgColor
        backgroundMask.fillColor = nil
        
        layer.mask = backgroundMask
        
        // Draw progress layer
        progressLayer.path = baseCirclePath.cgPath
        //        progressFillLayer.lineCap = .round
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress / 10
        progressLayer.lineWidth = backgroundMask.lineWidth
        progressLayer.fillColor = nil
        progressLayer.strokeColor = strokeColor.cgColor
        
        layer.addSublayer(progressLayer)
        layer.addSublayer(gradientLayer)
        
        // Transform (rotate) the progress fill so that the fill starts at 0 degrees
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, -1)
        
        // Draw gradient
        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.4, 0.5, 0.6]
        gradientLayer.frame = baseRect
        gradientLayer.colors = [strokeColor.cgColor, UIColor.white.cgColor, strokeColor.cgColor]
        
        
        context.restoreGState()
    }
    
    
    func createGradientAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        rotationAnimation.fromValue = CGFloat(Double.pi / 2)
        rotationAnimation.toValue = CGFloat(2.5 * Double.pi)
        rotationAnimation.repeatCount = Float.infinity
        rotationAnimation.duration = 4
        
        gradientLayer.add(rotationAnimation, forKey: "rotationAnimation")
        
        let startPointAnimation = CAKeyframeAnimation(keyPath: "startPoint")
        startPointAnimation.values = [CGPoint.zero, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)]
        
        startPointAnimation.repeatCount = Float.infinity
        startPointAnimation.duration = 1
        
        let endPointAnimation = CAKeyframeAnimation(keyPath: "endPoint")
        endPointAnimation.values = [CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint.zero]
        
        endPointAnimation.repeatCount = Float.infinity
        endPointAnimation.duration = 1
        
        gradientLayer.add(startPointAnimation, forKey: "startPointAnimation")
        gradientLayer.add(endPointAnimation, forKey: "endPointAnimation")
    }
    
    
}
