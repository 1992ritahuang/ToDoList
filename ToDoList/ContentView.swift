//
//  ContentView.swift
//  ToDoList
//
//  Created by Rita Huang on 2025/1/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ToDoViewModel()
    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // add input view
                HStack {
                    TextField("新增待辦事項...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        guard !newTaskTitle.isEmpty else { return }
                        viewModel.addItem(title: newTaskTitle)
                        newTaskTitle = "" // clear input view
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                    }
                }
                
                // to do list
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Button(action: {
                                viewModel.toggleCompletion(of: item)
                            }) {
                                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isCompleted ? .green : .gray)
                            }
                            Text(item.title)
                                .strikethrough(item.isCompleted, color: .red)
                        }
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
            }
            .navigationTitle("待辦事項")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ContentView()
}
