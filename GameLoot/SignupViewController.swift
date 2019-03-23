//
//  SignupViewController.swift
//  GameLoot
//
//  Created by shubham goel on 23/03/2019.
//  Copyright © 2019 Creator Lab. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var sname: UITextField!
    @IBOutlet weak var em: UITextField!
    @IBOutlet weak var pw: UITextField!
    
    let db = Firestore.firestore()


    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: em.text!, password: pw.text!, completion: { (user, error) in
            let uid = user?.user.uid
            if user != nil{
                
                self.db.collection("Userinfo").addDocument(data: [
                    "FirstName" : self.fname.text,
                    "LastName" : self.sname.text,
                    "Coins" : "100",
                    "UserID" : uid
                    
                    
                    
                    
                    ], completion: { (error) in
                        
                        if error == nil{
                            
                            self.performSegue(withIdentifier: "signedup", sender: self)
                            
                            
                        }
                    
                })
                
                
                
            }
        })
        
        
    }
    

}
