//
//  DrawingViewController.swift
//  Test3
//
//  Created by Persistent on 7/1/20.
//  Copyright © 2020 CFN. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var triangle: UIImageView!
    @IBOutlet weak var square: UIImageView!

    @IBAction func drawCircle(_ sender: UIButton) {
        circle.isHidden = !circle.isHidden
    }
    
    @IBAction func drawTriangle(_ sender: UIButton) {
        triangle.isHidden = !triangle.isHidden
    }
    
    @IBAction func drawSquare(_ sender: Any) {
        square.isHidden = !square.isHidden
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often wantto do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
