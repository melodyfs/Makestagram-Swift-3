//
//  FindFriendsCell.swift
//  Makestagram
//
//  Created by Melody on 6/22/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class FindFriendsCell: UITableViewCell {
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var followButton: UIButton!
    
    weak var delegate: FindFriendsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followButton.layer.borderColor = UIColor.lightGray.cgColor
        followButton.layer.borderWidth = 1
        followButton.layer.cornerRadius = 6
        followButton.clipsToBounds = true
        
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitle("Following", for: .selected)
    }
    
    @IBAction func followButtonTapped(_ sender: UIButton) {
        delegate?.didTappedFollowButton(sender, on: self)
    }
    
    
}

protocol FindFriendsCellDelegate: class {
    func didTappedFollowButton(_ followButton: UIButton, on cell: FindFriendsCell)
    
    
}
