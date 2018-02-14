//
//  HomeController.swift
//  I Do
//
//  Created by Tytus Planck on 2/14/18.
//  Copyright © 2018 Tytus Planck. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        logoutButton.addTarget(self, action: #selector(logOutAction), for: .touchUpInside)
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutAction(sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Login")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: Actions
    
    
}
