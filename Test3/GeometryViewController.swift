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
    var lines:[CAShapeLayer] = []
    var activated_button: UIButton? = nil
    let circle_radius = CGFloat(40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target:self, action: #selector(self.createDot(_: )))
        self.view.backgroundColor = .white
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    @objc func createDot(_ touch: UITapGestureRecognizer? = nil) {
        let touchPoint = touch!.location(in: self.view)
        let button = UIButton(frame: CGRect(x: touchPoint.x, y: touchPoint.y, width:circle_radius, height: circle_radius))
        button.layer.cornerRadius = circle_radius/2
        button.layer.masksToBounds = true
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(self.formLine(_: )), for: .touchUpInside)
        self.view.addSubview(button)
        points.append(button)
    }
    
    @objc func formLine(_ button: UIButton? = nil)
    {
        if activated_button == nil
        {
            //TODO When clicking anything else, reset activatedButton
            activated_button = button
        }
        else
        
        {
            let path = UIBezierPath()
            let start = CGPoint(x: activated_button!.frame.origin.x + circle_radius/2, y: activated_button!.frame.origin.y + circle_radius/2)
            let end = CGPoint(x: button!.frame.origin.x + circle_radius/2, y: button!.frame.origin.y + circle_radius/2)
            
            path.move(to:start)
            path.addLine(to: end)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.lineWidth = circle_radius/4
            
            view.layer.addSublayer(shapeLayer)
            lines.append(shapeLayer)
            
            activated_button = nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        for point in points {
            point.removeFromSuperview()
        }
        for line in lines {
            line.removeFromSuperlayer()
        }
        
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
