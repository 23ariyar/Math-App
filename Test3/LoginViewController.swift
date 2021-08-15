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
    
    @IBAction func login(_ sender: UIButton) {
        guard let email = email.text, !email.isEmpty else {
            setMessage(msg: "Email or Password field cannot be empty")
            return
        }
        guard let password = password.text, !password.isEmpty else {
            setMessage(msg: "Email or Password field cannot be empty")
            return
        }
        
        setMessage(msg: "")
        
        print("Email:", email)
        print("Password:", password)
        print("login pressed")
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                self!.setMessage(msg: error!.localizedDescription)
                print(error!.localizedDescription)
                return
            }
            self!.setMessage(msg: "\(user.email!) logged in")
            print("logged in", user.email!)
        }
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        guard let email = email.text, !email.isEmpty else {
            setMessage(msg: "Email or Password field cannot be empty")
            return
        }
        guard let password = password.text, !password.isEmpty else {
            setMessage(msg: "Email or Password field cannot be empty")
            return
        }
        
        setMessage(msg: "")
        
        print("Email:", email)
        print("Password:", password)
        print("signup pressed")
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                self.setMessage(msg: error!.localizedDescription)
                print(error!.localizedDescription)
                return
            }
            self.setMessage(msg: "\(user.email!) created")
            print("\(user.email!) created")
        }
    }
    
    func setMessage(msg: String) {
        message.text = msg
    }
}
