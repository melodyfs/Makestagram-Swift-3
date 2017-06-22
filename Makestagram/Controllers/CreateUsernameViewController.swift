//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Melody on 6/20/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth



class CreateUsernameViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        
        
        UserService.create(firUser, username: username) { (user) in
            guard let _ = user else {
                //handle error
                return
            }
            
            User.setCurrent(user!, writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
            }
        
    }
}

