//
//  LoginViewController.swift
//  I Do
//
//  Created by Tytus Planck on 2/5/18.
//  Copyright © 2018 Tytus Planck. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleSignIn() {
        guard let email = email.text else { return }
        guard let password = password.text else { return }
        
        //setContinueButton(enabled: false)
        // loginButton.setTitle("", for: .normal)
//        activityView.startAnimating()
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: false, completion: nil)
//                self.navigationController?.pushViewController(HomeViewController, animated: true)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                self.present(vc!, animated: true, completion: nil)
            } else {
                print("Error logging in: \(error!.localizedDescription)")
            }
        }
    }
    
    
}
