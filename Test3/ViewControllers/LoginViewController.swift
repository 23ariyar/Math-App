//
//  LoginViewController.swift
//  Test3
//
//  Created by Mathias Ooi on 8/11/21.
//  Copyright © 2021 CFN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet weak var message: UILabel!
    /**
    Custom error for reading logins
     */
    enum LoginError: Error {
        case emptyField
    }
    
    /**
     Reads data from email and password textfield
     
     - Throws: `LoginError.emptyField`
     
     - Returns: Tuple of email and Data
     
     */
    func readData() throws -> (email: String, password: String)? {
        guard let email = email.text, !email.isEmpty else {
            throw LoginError.emptyField
        }
        guard let password = password.text, !password.isEmpty else {
            throw LoginError.emptyField
        }
                
        print("Email:", email)
        print("Password:", password)
        
        return (email, password)
    }

    /**
     Sets UILabel to given message
     
     - Parameters:
        - msg: Message you want displayed
     */
    func setMessage(msg: String) {
        message.text = msg
    }
    
    /**
     Handles authentification of  user using FIrebase, when login button pressed
     */
    @IBAction func login(_ sender: UIButton) {
        // print("login pressed")
        do {
            setMessage(msg: "")
            let (email, password) = try readData()!
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let user = authResult?.user, error == nil else {
                    // Handle Firebase auth errors
                    self!.setMessage(msg: error!.localizedDescription)
                    print(error!.localizedDescription)
                    return
                }
                self!.setMessage(msg: "\(user.email!) logged in")
                print("logged in", user.email!)
            }
        }
        catch LoginError.emptyField {
            // Handle custom invalid empty error
            setMessage(msg: "Email or Password field cannot be empty")
        }
        catch {
            // Handle other errors
            return
        }
    }
    
    /**
     Handles signing up users with Firebase, when sign up button pressed
     */
    @IBAction func signUp(_ sender: UIButton) {
        // print("sign up pressed")
        do {
            setMessage(msg: "")
            let (email, password) = try readData()!
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                guard let user = authResult?.user, error == nil else {
                    // Handle Firebase auth errors
                    self.setMessage(msg: error!.localizedDescription)
                    print(error!.localizedDescription)
                    return
                }
                self.setMessage(msg: "\(user.email!) created")
                print("\(user.email!) created")
            }
        }
        catch LoginError.emptyField {
            // Handle custom invalid empty error
            setMessage(msg: "Email or Password field cannot be empty")
        }
        catch {
            // Handle other errors
            return
        }
    }
}
