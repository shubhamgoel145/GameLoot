//
//  LoginViewController.swift
//  GameLoot
//
//  Created by shubham goel on 23/03/2019.
//  Copyright © 2019 Creator Lab. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loggedin", sender: self)

            }
        })
        
        
    }
    

}
