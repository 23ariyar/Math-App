//
//  GeometryViewController.swift
//  Test3
//
//  Created by Ariya Reddy on 7/27/21.
//  Copyright © 2021 CFN. All rights reserved.
//

/**
 
 */
import Foundation
import UIKit
import PDFKit
import ReplayKit
import Firebase
import FirebaseAuth

import MessageUI
// Send pdf screenshot to email
// Should implement a better way of saving work

class GeometryViewController: UIViewController, RPPreviewViewControllerDelegate, MFMailComposeViewControllerDelegate {

    let circle_radius = CGFloat(40)
    var activated_button: UIButton? = nil
    var shape_factory = ShapeFactory(line_properties: (weight: CGFloat(40)/2, color: .black), point_properties: (radius: CGFloat(40), color: .black))
    @IBOutlet var saveStatus: UILabel!
    
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
    
    
    /**
     Takes a screenshot and emails it to user
     */
    @IBAction func emailTapped(_ sender: Any) {
        sendPDF(url: takeScreenshot()!.1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /**
     Cahnges Save Status Label to a new status
     */
    func updateSaveStatus(_ status: String) {
        saveStatus.text = status
    }
    
    /**
     Sends PDF to logged in email
     
     - Note: Does not run on simulator
     */
    func sendPDF(url: URL) {
        // Check auth status
        guard Auth.auth().currentUser != nil else {
            self.updateSaveStatus("No account logged in")
            return
        }
        guard MFMailComposeViewController.canSendMail() else {
            self.updateSaveStatus("Device cannot send mail")
            return
        }
        
        do {
            // Send email to usr with attached pdf
            let attach = try Data(contentsOf: url)
            let email = Auth.auth().currentUser!.email!
            
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setSubject("CFN APP SCREENSHOT TEST")
            mail.setMessageBody("", isHTML: false)
            mail.addAttachmentData(attach, mimeType: "application/pdf", fileName: "CFN_APP_SCREENSHOT")
            self.present(mail, animated: true
                , completion: nil)
        }
        catch let error {
            print("We have encountered error \(error.localizedDescription)")
        }

    }
}


