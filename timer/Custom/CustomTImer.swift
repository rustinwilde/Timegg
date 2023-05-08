//
//  CustomTImer.swift
//  timer
//
//  Created by Rustin Wilde on 02.05.23.
//

import UIKit

class CustomTimer : UIView {
    
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
         createCircularPath()
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         createCircularPath()
     }
    
    
    
    private func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: frame.width/2 - 5, startAngle:  -CGFloat.pi/2, endAngle: 2.0 * CGFloat.pi, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 12
        shapeLayer.fillColor = UIColor(named: "Color")?.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        layer.addSublayer(shapeLayer)
    }
    
    func animate (duration : TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = duration
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "circularAnimation")
    }
    
}
