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
   
    
    var name:String = ""
    var DOB:String = ""
    var childNames:[String] = []
    var childDOB:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            let result = formatter.string(from: date)
            print(result)
            
        
        let user = Auth.auth().currentUser
        let email = user!.email
        print(email!)
        
        let s1 = email!.replacingOccurrences(of: ".", with: ",", options: .literal, range: nil)
        let s2 = s1.replacingOccurrences(of: "$", with: ",", options: .literal, range: nil)
        let s3 = s2.replacingOccurrences(of: "]", with: ",", options: .literal, range: nil)
        let s4 = s3.replacingOccurrences(of: "[", with: ",", options: .literal, range: nil)
        let s5 = s4.replacingOccurrences(of: "/", with: ",", options: .literal, range: nil)
        
        let ref = Database.database().reference().child("testing")
        
//        var refHandle = ref.observe(DataEventType.value, with: { (snapshot) in
//            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//                print("This is the object form new function : \(postDict)")
//            print(snapshot.childSnapshot(forPath: "abhi"))
//            var s = snapshot.childSnapshot(forPath: "abhi")
//            print(s.childSnapshot(forPath: "name").value)
//        })
//        
        print("--------------------------------------------------------------------")
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in

            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                print(snapshot.childrenCount)
                
                for child in snapshots
                {
                    
                    
                    
                    
                    var s = snapshot.childSnapshot(forPath: child.key)
                    self.childNames.append(s.childSnapshot(forPath: "name").value as! String)
                    self.childDOB.append(s.childSnapshot(forPath: "city").value as! String)


                    
//                    let firUserId =
//                    firUserId.value(forKey: "name")
//                    print(firUserId.value(forKey: "name")!)
//                    print(firUserId)
//                    print(firUserId)
//                    print(receivePostSnapshot)
//                    self.childNames.append(child.key)
                }
                
            }
            
            
            print(self.childDOB)
            print(self.childNames)
            
            if snapshot.hasChild(s5){
                
                print("true rooms exist")
                ref.child("room1").setValue("Auth Is true")
                
                //Mark: Reading value of child form firebase databse.
//                let mNickName = Database.database().reference().child(s5).child("Child").child("dlfkj").child("Nick name")
//                let mDOB = Database.database().reference().child(s5).child("Child").child("dlfkj").child("dob")
                
            }else{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AddChildd")
                self.present(newViewController, animated: false,completion: nil)
                
                print(s5)

                print("false room doesn't exist")
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
