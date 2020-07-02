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
    
    var showCircle = false
    
    @IBAction func drawCircle(_ sender: UIButton) {
        
        if (showCircle == false) {
            circle.isHidden = false
        }
        else {
            circle.isHidden = true
        }
        
        showCircle = !showCircle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle.isHidden = !showCircle
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
