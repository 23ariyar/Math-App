//
//  ViewController.swift
//  Test3
//
//  Created by Persistent on 6/29/20.
//  Copyright © 2020 CFN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leadingConstraint.constant = -180
    }
    
    @IBAction func openMenu(_ sender: Any) {
        
        if (menuShowing)
        {
            leadingConstraint.constant = -180
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        else
        {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        
        menuShowing = !menuShowing
        
    }



}

