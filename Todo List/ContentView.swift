//
//  ContentView.swift
//  Todo List
//
//  Created by Rasmus Lindholm on 2024-01-16.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = [Todo(title: "Build an app"), Todo(title: "Lecture")]
    @State private var textInput = ""
    @State private var selectedCategory: String?
    @State private var categories = ["Personal", "Work", "Shopping"]
    @State private var selectedTodo: Todo?

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select a category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    ForEach(filteredTodos) { todo in
                        NavigationLink(destination: Details(todo: todo)) {
                            HStack {
                                Image(systemName: todo.isDone ? "checkmark.applewatch" : "applewatch")
                                Text(todo.title)
                            }
                        }
                        .onTapGesture {
                            if let index = todos.firstIndex(where: { $0.id == todo.id }) {
                                todos[index].isDone.toggle()
                            }
                        }
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            todos.remove(at: index)
                        }
                    })
                }
                 

                TextField("New todo...", text: $textInput)
                    .onSubmit {
                        todos.append(Todo(title: textInput, category: selectedCategory))
                        textInput = ""
                    }
            }
            .navigationTitle("My Todos")
        }
    }

    var filteredTodos: [Todo] {
        if let selectedCategory = selectedCategory {
            return todos.filter { $0.category == selectedCategory }
        } else {
            return todos
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
