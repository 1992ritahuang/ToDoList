//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Rita Huang on 2025/1/19.
//

import Foundation
import Combine

class ToDoViewModel: ObservableObject {
    @Published var items: [ToDoItem] = []

    func addItem(title: String) {
        let newItem = ToDoItem(title: title, isCompleted: false)
        items.append(newItem)
    }
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func toggleCompletion(of item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }
}
