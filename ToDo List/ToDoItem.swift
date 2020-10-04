//
//  ToDoItem.swift
//  ToDo List
//
//  Created by John Pappas on 9/26/20.
//  Copyright © 2020 John Pappas. All rights reserved.
//

import Foundation

struct ToDoItem: Codable {
    var name: String
    var date: Date
    var notes: String
    var reminderSet: Bool
    var notificationID: String?
    var completed: Bool
}
