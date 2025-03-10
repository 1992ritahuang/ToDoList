//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Rita Huang on 2025/1/19.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
    }
}
