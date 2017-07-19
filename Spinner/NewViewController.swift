//
//  NewViewController.swift
//  Spinner
//
//  Created by Local Admin on 17/07/17.
//  Copyright © 2017 training. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import Foundation
class NewViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!

    @IBOutlet weak var progress: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.startAnimating()
        
        let user = Auth.auth().currentUser
        let email = user!.email
        print(email!)
        
        let s1 = email!.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        let s2 = s1.replacingOccurrences(of: "$", with: ",", options: .literal, range: nil)
        let s3 = s2.replacingOccurrences(of: "]", with: ",", options: .literal, range: nil)
        let s4 = s3.replacingOccurrences(of: "[", with: ",", options: .literal, range: nil)
        let s5 = s4.replacingOccurrences(of: "/", with: ",", options: .literal, range: nil)
        
        
        let ref = Database.database().reference()
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if snapshot.hasChild(s5){
                
                print("true rooms exist")
                ref.child("room1").setValue("Auth Is true")
                self.progress.stopAnimating()
            }else{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "Update")
                self.present(newViewController, animated: false,completion: nil)
                
                print(s5)

                print("false room doesn't exist")
                self.progress.stopAnimating()
            }
            
            
        })
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSO(_ sender: Any) {
        try! Auth.auth().signOut()
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Register")
        self.present(newViewController, animated: false,completion: nil)
    }

  
    
    
    
    
    

    
    
    
    
    
    
}
