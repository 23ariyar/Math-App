//
//  ViewController.swift
//  Test3
//
//  Created by Persistent on 6/29/20.
//  Copyright © 2020 CFN. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var message: UITextField!
    
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

    /**
     If the feedback button is tapped, a MFMailComposeViewController is activated
     and the user can send an email to the given recipient
        
     Needs to be run on an iPad or your Mac (Designed for iPad)
     */
    @IBAction func feedbackButtonTapped(_ sender: Any) {
        //makes sure the user can send mail
        guard MFMailComposeViewController.canSendMail() else {
            message.text = "An error occurred"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.message.text = ""
            }
            return
            
        }
        
        //sets up email subject, recipient, etc
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["23ariyar@students.harker.org"])
        composer.setSubject("Feedback")

        //animates in the mail view controller
        present(composer, animated: true)
    }
}
