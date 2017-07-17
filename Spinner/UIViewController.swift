//
//  ViewController.swift
//  Spinner
//
//  Created by Local Admin on 17/07/17.
//  Copyright © 2017 training. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLogin(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: Username.text!, password: Password.text!) { (user, error) in
            
            if error == nil {
                print("You have successfully signed up")
                //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                
//                self.present(vc!, animated: true, completion: nil)
                 self.loginn()
            } else {
                let alertController = UIAlertController(title: "Vacciminderscomplete Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        
        
    }
    func loginn(){
        Auth.auth().signIn(withEmail: Username.text!, password: Password.text!) { (User, Error) in
            
            if Error != nil{
                _ = UIAlertController(title: "Error", message: Error?.localizedDescription, preferredStyle: .alert)
                
            }
                
            else{
                print("Successful sign innnn.")
            }
            
            
        }
        
    }

}

