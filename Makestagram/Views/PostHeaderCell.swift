//
//  PostHeaderCell.swift
//  Makestagram
//
//  Created by Melody on 6/22/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class PostHeaderCell: UITableViewCell {
    
    static let height: CGFloat = 54

    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func optionsButtonTapped(_ sender: Any) {
        print("Options button tapped")
    }
}
