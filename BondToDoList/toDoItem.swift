//
//  toDoItem.swift
//  BondToDoList
//
//  Created by Scholar on 5/12/24.
//

import Foundation
import SwiftData

@Model
class toDoItem {
    var title: String
    var isImportant: Bool
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}
