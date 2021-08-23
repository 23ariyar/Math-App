//
//  ViewController.swift
//  Test3
//
//  Created by Persistent on 6/29/20.
//  Copyright © 2020 CFN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = false
    
    var handle: AuthStateDidChangeListenerHandle?
    
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Firebase auth listener
        handle = Auth.auth().addStateDidChangeListener {auth, user in
            print("Auth change")
            self.changeUserLabel(user?.email)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Remove Firebase auth listener
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    /**
     Strips the @gmail.com part of an email address
     
     - Parameters:
        - email:
            Assumes is valid
     - Returns:
        Stripped email address
     */
    func stripEmail(_ email: String?) -> String {
        return email?.components(separatedBy: "@")[0] ?? ""
    }
    
    /**
     Changes the user label to display the email address name
     */
    func changeUserLabel(_ name: String?) {
        userLabel.text = stripEmail(name)
    }
}

