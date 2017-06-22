//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Melody on 6/22/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class PostActionCell: UITableViewCell {
    
    static let height: CGFloat = 46

    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func likeActionTapped(_ sender: Any) {
        print("Like Button Tapped")
    }
    
}
