//
//  GeometryViewController.swift
//  Test3
//
//  Created by ariya redddyy on 7/27/21.
//  Copyright © 2021 CFN. All rights reserved.
//

import UIKit
 
class GeometryViewController: UIViewController {

    
    var points:[UIButton] = []
    //var lines:[UIBezierPath] = []
    var activatedButton: UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target:self, action: #selector(self.createDot(_: )))
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    @objc func createDot(_ touch: UITapGestureRecognizer? = nil) {
        let touchPoint = touch!.location(in: self.view)
        let button = UIButton(frame: CGRect(x: touchPoint.x, y: touchPoint.y, width: 20, height: 20))
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(self.formLine(_: )), for: .touchUpInside)
        self.view.addSubview(button)
        points.append(button)
    }
    
    @objc func formLine(_ button: UIButton? = nil)
    {
        if activatedButton == nil
        {
            //TODO When clicking anything else, reset activatedButton
            activatedButton = button
        }
        else
        {
            //TODO Make pretty tehe
            let path = UIBezierPath()
            path.move(to: activatedButton!.frame.origin)
            path.addLine(to: button!.frame.origin)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.lineWidth = 5
            view.layer.addSublayer(shapeLayer)
            activatedButton = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
