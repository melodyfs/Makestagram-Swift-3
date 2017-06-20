//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Melody on 6/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self as FUIAuthDelegate
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
}


extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        guard let user: FIRUser = user
            else { return }
        
        //retrieve data from user snapshot
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
        
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.username).")
            } else {
               self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
            
            
            
        })
        
        //Let user into the main storyboard
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let _ = User(snapshot: snapshot) {
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()

            } else {
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        })
        
//        Setting for current user
//        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
//            if let user = User(snapshot: snapshot) {
//                User.setCurrent(user)
//                
//                let initialViewController = UIStoryboard.initialViewController(for: .main)
//                    self.view.window?.rootViewController = initialViewController
//                    self.view.window?.makeKeyAndVisible()
//            } else {
//                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//            }
//        })
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }
        
        
    }
}
