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
    var progress: CGFloat = 0.5
    let gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.lightGray.cgColor)
        
        context.fill(bounds)
        
        
        let baseRect = CGRect(x: 0, y: 0, width: baseCircleWidth, height: baseCircleHeight)
        
        // Draw circle
        let circleMask = CAShapeLayer()
        let baseCirclePath = UIBezierPath(ovalIn: baseRect.insetBy(dx: 50, dy: 50))
        
        circleMask.path = baseCirclePath.cgPath
        circleMask.lineWidth = 50
        circleMask.strokeColor = UIColor.black.cgColor
        circleMask.fillColor = nil
        
        layer.mask = circleMask
        
        // Draw progress fill
        let progressFillLayer = CAShapeLayer()
        
        progressFillLayer.path = circleMask.path
        progressFillLayer.lineCap = .round
        progressFillLayer.strokeStart = 0
        progressFillLayer.strokeEnd = progress
        progressFillLayer.lineWidth = circleMask.lineWidth
        progressFillLayer.fillColor = nil
        progressFillLayer.strokeColor = strokeColor.cgColor
        
        layer.addSublayer(progressFillLayer)
        layer.addSublayer(gradientLayer)
        
        // Transform (rotate) the progress fill so that the fill starts at 0 degrees
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180), 0, 0, -1)
        
        // Draw gradient
        gradientLayer.mask = progressFillLayer
        gradientLayer.locations = [0.4, 0.5, 0.6]
        gradientLayer.frame = baseRect
        gradientLayer.colors = [strokeColor.cgColor, UIColor.white.cgColor, strokeColor.cgColor]
        
    
        context.restoreGState()
    }
    
}
