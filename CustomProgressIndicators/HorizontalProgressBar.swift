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
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(bounds)
        
        
        // Draw base rect
        let progressBarBaseRect = CGRect(x: 0, y: 0, width: baseBarWidth, height: baseBarHeight)
        let progressBarPath = UIBezierPath(roundedRect: progressBarBaseRect, cornerRadius: progressBarBaseRect.height * 0.25)
        baseColor.setFill()
        progressBarPath.fill()
        
        
        context.restoreGState()
        
    }
    
    
}
