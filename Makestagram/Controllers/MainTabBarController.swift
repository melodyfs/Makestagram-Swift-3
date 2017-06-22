//
//  MainTabBarController.swift
//  Makestagram
//
//  Created by Melody on 6/21/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    // MARAK: - Properties
    
    let photoHelpers = MGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //called whenever an image is received
        photoHelpers.completionHandler = { image in
            
            PostService.create(for: image)
        }
        
        delegate = self
        tabBar.unselectedItemTintColor = .black
        
    }
    
}

//corresponding with user's selection
extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.tabBarItem.tag == 1 {
            photoHelpers.presentActionSheet(from: self)
            
            return false
        } else {
        
        return true
        }
    }
}
