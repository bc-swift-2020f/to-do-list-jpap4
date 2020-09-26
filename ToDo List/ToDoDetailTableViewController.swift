//
//  ToDoDetailTableViewController.swift
//  ToDo List
//
//  Created by John Pappas on 9/26/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {

    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var noteView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion:  nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
