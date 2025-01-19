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
    var isFinish: Bool
    
    init(title: String, isFinish: Bool) {
        self.id = UUID()
        self.title = title
        self.isFinish = isFinish
    }
}
