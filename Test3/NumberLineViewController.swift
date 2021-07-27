//
//  NumberLineViewController.swift
//  Test3
//
//  Created by Persistent on 7/1/20.
//  Copyright © 2020 CFN. All rights reserved.
//

import UIKit

class NumberLineViewController: UIViewController {
    
    var lowerBound: String = ""

    @IBOutlet weak var lowerInput: UITextField!

    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func getV(_ sender: UIButton) {
        
        label.text = "Hello"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
