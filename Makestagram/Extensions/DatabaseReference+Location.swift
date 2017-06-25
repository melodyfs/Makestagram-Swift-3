//
//  DatabaseReference+Location.swift
//  Makestagram
//
//  Created by Melody on 6/23/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import FirebaseDatabase

extension DatabaseReference {
    enum MGLocation {
        case root
        case posts(uid: String)
        case showPost(uid: String, postKey: String)
        
        func asDatabaseReference() -> DatabaseReference{
            let root = Database.database().reference()
            
            switch self {
            case .root:
                return root
                
            case .posts(let uid):
                return root.child("posts").child(uid)
                
            case let .showPost(uid, postKey):
                return root.child("posts").child(uid).child(postKey)
                
            }
        }
        
    }
    
    static func toLocation(_ location: MGLocation) -> DatabaseReference {
        return location.asDatabaseReference()
    }
}
