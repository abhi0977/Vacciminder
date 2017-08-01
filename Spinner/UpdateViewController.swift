//
//  UpdateViewController.swift
//  Spinner
//
//  Created by Local Admin on 19/07/17.
//  Copyright © 2017 training. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UpdateViewController: UIViewController {
    
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var mobile: UITextField!
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var txtemail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Database.database().reference()
        txtemail.text = Auth.auth().currentUser?.email
        
        // Do any additional setup after loading the view.
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
    
    
    
    
    
    
    
    
    @IBAction func btnUpdate(_ sender: Any) {
        
        let user = Auth.auth().currentUser
        let email = user?.email
        txtemail.text = email
        
        let s1 = email!.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        let s2 = s1.replacingOccurrences(of: "$", with: ",", options: .literal, range: nil)
        let s3 = s2.replacingOccurrences(of: "]", with: ",", options: .literal, range: nil)
        let s4 = s3.replacingOccurrences(of: "[", with: ",", options: .literal, range: nil)
        let s5 = s4.replacingOccurrences(of: "/", with: ",", options: .literal, range: nil)
        
        let ref = Database.database().reference()
        ref.child(s5).child("Name").setValue(name.text)
        ref.child(s5).child("Email").setValue(txtemail.text)
        ref.child(s5).child("Mobile").setValue(mobile.text)
        ref.child(s5).child("Gender").setValue(gender.text)
        
    }
    
    
    
    
  

}
