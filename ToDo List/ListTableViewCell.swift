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
    

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    weak var delegate: ListTableViewCellDelegate?
    
    var toDoItem: ToDoItem! {
        didSet{
            nameLabel.text = toDoItem.name
            checkBoxButton.isSelected = toDoItem.completed
        }
    }


    @IBAction func checkToggled(_ sender: Any) {
        delegate?.checkBoxToggle(sender: self)
    }
    
}
