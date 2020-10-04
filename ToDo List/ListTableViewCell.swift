//
//  ListTableViewCell.swift
//  ToDo List
//
//  Created by John Pappas on 10/4/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import UIKit

protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender:ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {
    
    weak var delegate: ListTableViewCellDelegate?

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    

    @IBAction func checkToggled(_ sender: Any) {
        delegate?.checkBoxToggle(sender: self)
    }
    
}
