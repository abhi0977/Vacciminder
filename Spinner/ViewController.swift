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
        
        Auth.auth().signIn(withEmail: Username.text!, password: Password.text!) { (User, Error) in
            
            if Error != nil{
                _ = UIAlertController(title: "Error", message: Error?.localizedDescription, preferredStyle: .alert)
                
            }
                
            else{
                print("Successful sign innnn.")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "Dashboard")
                self.present(newViewController, animated: false,completion: nil)
            }
            
            
        }
     
        
        
    }
    
    @IBAction func Reg(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Register")
        self.present(newViewController, animated: true,completion: nil)
    }

}

