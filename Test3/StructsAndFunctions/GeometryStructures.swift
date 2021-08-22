//
//  GeometryStructures.swift
//  Test3
//
//  Created by Ariya Reddy on 7/28/21.
//  Copyright © 2021 CFN. All rights reserved.
//

import Foundation
import UIKit

/**
 Enum is used to create a new "object-type" which can be both a CAShapeLayer or a UIButton - This is good for grouping
 all the objects that will be drawn into the GeometryViewController because you can only make arrays of one type
 */
enum Shape {
    case line(CAShapeLayer)
    case point(UIButton)
    
    func clear() { //clears the shape from the view its added to
        switch self{
        case .line(let line):
            line.removeFromSuperlayer()
        case .point(let point):
            point.removeFromSuperview()
        }
    }
    
    func addToView(_ view: UIViewController) { //adds the shape to a given view
        switch self{
        case .line(let line):
            view.view.layer.addSublayer(line)
        case .point(let point):
            view.view.addSubview(point)
        }
    }
}

/// A factory to make all the shapes needed in GeometryViewController
struct ShapeFactory {
    var line_properties: (weight:CGFloat, color:UIColor)
    var point_properties: (radius: CGFloat, color:UIColor)
    var objects = [Shape]()
    
    /**
         This function creates a dot given to the specification to point_properties. The return value must be added to the view in order to be visible
         */
    mutating func makePoint(location: CGPoint, action:Selector? = nil, view:UIViewController? = nil) -> UIButton {
        let point = UIButton(frame: CGRect(origin: location, size: CGSize(width: point_properties.radius, height: point_properties.radius)))
        point.layer.cornerRadius = point_properties.radius/2
        point.layer.masksToBounds = true
        point.backgroundColor = point_properties.color
        point.addTarget(self, action: #selector(GeometryViewController.formLine(_: )), for: .touchUpInside)
        objects.append(Shape.point(point))
        view?.view.addSubview(point) //if view given, automatically add the point
        return point
        
    }
    
    /**
         This function creates a line given to the specification of line_properties. The return value must be added to the view in order to be visible
         */
    mutating func makeLine(start: CGPoint, end:CGPoint, circle_radius:CGFloat, view:UIViewController? = nil) -> CAShapeLayer{ //Creates a line given the specifications of the struct
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: start.x + circle_radius/2, y: start.y + circle_radius/2))
        path.addLine(to:CGPoint(x: end.x + circle_radius/2, y: end.y + circle_radius/2))
        
        let line = CAShapeLayer()
        line.path = path.cgPath
        line.strokeColor = line_properties.color.cgColor
        line.lineWidth = line_properties.weight
        objects.append(Shape.line(line))
        view?.view.layer.addSublayer(line) //if view given, automatically add the line
        
        return line
    }
    
    /**
     Clears all objects from its respective view
     */
    mutating func clear() {
        for object in objects{
            object.clear()
        }
        objects = []
    }
    
    /**
     Undos the last created object
     */
    mutating func undo() {
        objects[objects.count-1].clear()
        objects.remove(at: objects.count-1)
    }
    
    /**
     Returns all objcets connected to an instance of ShapeFactory
     */
    func getState() -> Array<Shape> {
        return objects
    }
    
    /**
     Sets objects to a new state and updates respective view to demonstrate the changes
     */
    mutating func setState(new_state: Array<Shape>, view: UIViewController) {
        clear()
        objects = new_state
        for object in new_state {
            object.addToView(view)
        }
    }
}

