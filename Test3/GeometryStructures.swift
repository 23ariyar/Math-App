//
//  GeometryStructures.swift
//  Test3
//
//  Created by ariya redddyy on 7/28/21.
//  Copyright © 2021 CFN. All rights reserved.
//

import Foundation
import UIKit

struct PointFactory {
    var color:UIColor = .black
    var radius:CGFloat = 40
    var points = [UIButton]()
    
    //add it to the view of the thing its being called in idfk
    mutating func makeDot(location: CGPoint, action:Selector? = nil) -> UIButton {
        let point = UIButton(frame: CGRect(origin: location, size: CGSize(width: radius, height: radius)))
        point.layer.cornerRadius = radius/2
        point.layer.masksToBounds = true
        point.backgroundColor = color
        point.addTarget(self, action: #selector(GeometryViewController.formLine(_: )), for: .touchUpInside)
        points.append(point)
        return point
    }
    
    func clear() {
        for point in points{
            point.removeFromSuperview()
        }
    }
}

struct LineFactory {
    var weight: CGFloat
    var color: UIColor
    var lines = [CAShapeLayer]()
        
    mutating func makeLine(start: CGPoint, end:CGPoint, circle_radius:CGFloat) -> CAShapeLayer{
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: start.x + circle_radius/2, y: start.y + circle_radius/2))
        path.addLine(to:CGPoint(x: end.x + circle_radius/2, y: end.y + circle_radius/2))
        
        let shape_layer = CAShapeLayer()
        shape_layer.path = path.cgPath
        shape_layer.strokeColor = color.cgColor
        shape_layer.lineWidth = weight
        lines.append(shape_layer)
        
        return shape_layer
    }
    
    func clear() {
        for line in lines {
            line.removeFromSuperlayer()
        }
    }
    

}

