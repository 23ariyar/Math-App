//
//  CalcViewController.swift
//  Test3
//
//  Created by Persistent on 7/1/20.
//  Copyright © 2020 CFN. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        
        else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 {
                label.text = "/";
            }
            
            if sender.tag == 13 {
                label.text = "x";
            }
            
            if sender.tag == 14 {
                label.text = "-";
            }
            
            if sender.tag == 15 {
                label.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        
        else if sender.tag == 16 {
            if operation == 12 {
                label.text = String(previousNumber / numberOnScreen)
            }
                
            else if operation == 13 {
                label.text = String(previousNumber * numberOnScreen)
            }
                
            else if operation == 14 {
                label.text = String(previousNumber - numberOnScreen)
            }
                
            else if operation == 15 {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        
        else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        
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
