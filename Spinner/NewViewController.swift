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

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
