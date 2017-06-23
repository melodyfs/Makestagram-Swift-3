//
//  PostActionCell.swift
//  Makestagram
//
//  Created by Melody on 6/22/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

protocol PostActionCellDelegate: class {
    func didTapLikeButton(_ likeButton: UIButton, on cell: PostActionCell)
}

class PostActionCell: UITableViewCell {
    
    static let height: CGFloat = 46

    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    //MARK: - Properties
    
    weak var delegate: PostActionCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func likeActionTapped(_ sender: Any) {
        
        delegate?.didTapLikeButton(sender as! UIButton, on: self)
        
    }
    
}
