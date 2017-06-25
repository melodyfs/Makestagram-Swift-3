//
//  UITableView+Utility.swift
//  Makestagram
//
//  Created by Melody on 6/24/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

protocol CellIdentifiable {
    
    static var cellIdentifier: String { get }
    
}

//define default values of the protocol
extension CellIdentifiable where Self: UITableViewCell {
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CellIdentifiable { }

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: CellIdentifiable {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
             fatalError("Error dequeuing cell for identifier \(T.cellIdentifier)")
        }
        
        return cell
        
    }
    
}
