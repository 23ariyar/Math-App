//
//  GeometryViewController.swift
//  Test3
//
//  Created by Ariya Reddy on 7/27/21.
//  Copyright © 2021 CFN. All rights reserved.
//

/**
 
 */
import UIKit
import ReplayKit

class GeometryViewController: UIViewController, RPPreviewViewControllerDelegate {

    let circle_radius = CGFloat(40)
    var activated_button: UIButton? = nil
    var shape_factory = ShapeFactory(line_properties: (weight: CGFloat(40)/2, color: .black), point_properties: (radius: CGFloat(40), color: .black))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target:self, action:#selector(self.createDot(_: ))) // Sets up tap recognizer
        self.view.backgroundColor = .white
        view.addGestureRecognizer(tap)
    }
    
    // Upon tapping an empty area in the screen, creates a point
    @objc func createDot(_ touch: UITapGestureRecognizer? = nil) {
        let _ = shape_factory.makePoint(location: touch!.location(in:self.view), action:#selector(self.formLine(_: )), view: self)
        activated_button = nil
    }
    
    // Upon tapping two buttons in sequence, draw a line between the two
    // Or if only tapping one button, make it active
    @objc func formLine(_ button: UIButton? = nil) {
        if activated_button == nil {
            activated_button = button
            return
        }
        
        let _ = shape_factory.makeLine(start:activated_button!.frame.origin, end:button!.frame.origin, circle_radius:circle_radius, view: self)
        activated_button = nil
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        shape_factory.clear()
    }

    @IBAction func undoTapped(_ sender: Any) {
        shape_factory.undo()
    }
    
    //Upon hitting the PDF button, take a screenshot, convert to PDF, and save
    @IBAction func pdfTapped(_ sender: Any) {
       let _ = takeScreenshot()
    }
    
    @IBAction func recordTapped(_ sender: Any) {
    }
    
    
    
    @IBAction func stopTapped(_ sender: Any) {
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


struct FreshmanStruct {
    var age: Int = 14
    var name: String
}

var aaron = FreshmanStruct(name: "aaron")
var olderFreshman = FreshmanStruct(age: 19, name: "boris")
