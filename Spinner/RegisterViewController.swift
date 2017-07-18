//
//  RegisterViewController.swift
//  Spinner
//
//  Created by Local Admin on 17/07/17.
//  Copyright © 2017 training. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import MapKit

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                // User is signed in. Show home screen
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "Dashboard")
                self.present(newViewController, animated: false,completion: nil)
            } else {
                // No User is signed in. Show user the login screen
            }
        }
        
//
//        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        self.centerMapOnLocation(location: initialLocation)

//         Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func btnSI(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: txtEmail.text!, password: txtPassword.text!) { (user, error) in
            
            if error == nil {
                print("You have successfully signed up")
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "Main")
                self.present(newViewController, animated: false,completion: nil)
                //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                
                //                self.present(vc!, animated: true, completion: nil)
            
            } else {
                let alertController = UIAlertController(title: "Vacciminderscomplete Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        
        
        
    }
    
    @IBAction func LogIn(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Main")
        self.present(newViewController, animated: true,completion: nil)
    }
//    func centerMapOnLocation(location: CLLocation) {
//        let regionRadius: CLLocationDistance = 1000
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//                                                                  regionRadius * 2.0, regionRadius * 2.0)
//        mapview.setRegion(coordinateRegion, animated: true)
//    }
   

}
