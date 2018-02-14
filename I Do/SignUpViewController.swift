//
//  SignUpViewController.swift
//  I Do
//
//  Created by Tytus Planck on 2/5/18.
//  Copyright © 2018 Tytus Planck. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    //MARK: Properties
    
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        submitButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleSignUp() {
        guard let email = newEmail.text else { return }
        guard let password = newPassword.text else { return }
        
        setSubmitButton(enabled: false)
        submitButton.setTitle("", for: .normal)
        //activityView.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = email
                
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("User display name changed!")
                        self.dismiss(animated: false, completion: nil)
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        self.present(vc!, animated: true, completion: nil)
                    } else {
                        print("Error: \(error!.localizedDescription)")
                    }
                }
                
            } else {
                print("Error: \(error!.localizedDescription)")
            }
        }
    }
    
    func setSubmitButton(enabled:Bool) {
        if enabled {
            submitButton.alpha = 1.0
            submitButton.isEnabled = true
        } else {
            submitButton.alpha = 0.5
            submitButton.isEnabled = false
        }
    }
    
    //MARK: Actions
    
    
}
