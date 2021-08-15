//
//  GeometryStructures.swift
//  Test3
//
//  Created by Ariya Reddy on 7/28/21.
//  Copyright © 2021 CFN. All rights reserved.
//

import Foundation
import UIKit

/// This struct is a factory for points
struct PointFactory {
    var color:UIColor = .black
    var radius:CGFloat = 40
    var points = [UIButton]()
    
    
    /**
     This function creates a dot given to the specification of the point factory struct. The return value must be added to the view in order to be visible
     */
    mutating func makeDot(location: CGPoint, action:Selector? = nil) -> UIButton {
        let point = UIButton(frame: CGRect(origin: location, size: CGSize(width: radius, height: radius)))
        point.layer.cornerRadius = radius/2
        point.layer.masksToBounds = true
        point.backgroundColor = color
        point.addTarget(self, action: #selector(GeometryViewController.formLine(_: )), for: .touchUpInside)
        points.append(point)
        return point
    }
    
    /**
     Clear all points from this factory
     */
    func clear() {
        for point in points{
            point.removeFromSuperview()
        }
    }
}

/// This struct is a factory for making lines - good for grouping together
struct LineFactory {
    var weight: CGFloat
    var color: UIColor
    var lines = [CAShapeLayer]()
        
    /**
     This function creates a dot given to the specification of the line factory struct. The return value must be added to the view in order to be visible
     */
    mutating func makeLine(start: CGPoint, end:CGPoint, circle_radius:CGFloat) -> CAShapeLayer{ //Creates a line given the specifications of the struct
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
    
    /**
     Clear all points from this factory
     */
    func clear() {
        for line in lines {
            line.removeFromSuperlayer()
        }
    }
}
