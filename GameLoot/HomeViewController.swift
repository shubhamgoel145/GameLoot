//
//  HomeViewController.swift
//  GameLoot
//
//  Created by shubham goel on 23/03/2019.
//  Copyright © 2019 Creator Lab. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController {

    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var wmessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = Firestore.firestore()
        let uid = Auth.auth().currentUser?.uid
        print(uid as! String)
        let ui = db.collection("Userinfo")
        let query = ui.whereField("UserID", isEqualTo: uid)
        print(query.getDocuments(completion: { (snapshot, erro) in
            if erro == nil{
                for document in (snapshot?.documents)! {
                    let fn = document.get("FirstName") as! String
                    let ln = document.get("LastName") as! String
                    let c = document.get("Coins") as! String
                    
                    self.wmessage.text = fn + " " + ln
                    self.points.text = c
                    
                }
            }
        }))
        wmessage.text = "HI " + (Auth.auth().currentUser?.email)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func SignOut(_ sender: Any) {
        
        do
        {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "logoutseg", sender: nil)

        }
        catch let error as NSError
        {
            print (error.localizedDescription)
        }
    }
}
