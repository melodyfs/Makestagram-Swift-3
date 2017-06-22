//
//  LikeService.swift
//  Makestagram
//
//  Created by Melody on 6/22/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct LikeService {
    
    static func create(for post: Post, success: @escaping (Bool) -> Void) {
        
        //each 'like' is a 'key'. Check if the post has a key
        guard let key = post.key else {
            return success(false)
        }
        
        let currentUID = User.current.uid
        
        let likesRef = Database.database().reference().child("postLikes").child(key).child(currentUID)
        likesRef.setValue(true) { (error, _) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return success(false)
            }
            
            return success(true)
        }
        
    }
    
    static func delete(for post: Post, success: @escaping (Bool) -> Void) {
        
        guard let key = post.key else {
            return success(false)
        }
        
    }
    
}
