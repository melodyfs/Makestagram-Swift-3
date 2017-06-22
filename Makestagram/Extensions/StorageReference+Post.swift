//
//  StorageReference+Post.swift
//  Makestagram
//
//  Created by Melody on 6/21/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import FirebaseStorage

//generate new location for each new uploaded image
extension StorageReference {
    static let dateFormatter = ISO8601DateFormatter()
    
    static func newPostImageReference() -> StorageReference {
        let uid = User.current.uid
        let timestamp = dateFormatter.string(from: Date())
        
        return Storage.storage().reference().child("images/posts/\(uid)/\(timestamp).jpg")
    }
}
