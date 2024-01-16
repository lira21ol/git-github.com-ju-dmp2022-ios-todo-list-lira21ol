//
//  ContentView.swift
//  Todo List
//
//  Created by Rasmus Lindholm on 2024-01-16.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = [Todo(title: "Build an app"),Todo(title: "Lecture")]
    @State var textInput = ""
    var body: some View {
        List {
            ForEach(todos){ todo in
                HStack {
                    Image(systemName: todo.isDone ?  "checkmark.applewatch"  : "applewatch")
                    Text(todo.title)
                }
                .onTapGesture {
                    if let index = todos.firstIndex(where: {
                        $0.id == todo.id}) {
                        todos[index].isDone.toggle()
                    }
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    todos.remove(at: index)}
            })
            TextField("New todo...", text: $textInput )
                .onSubmit {
                    todos.append(Todo(title: textInput))
                    textInput = ""
                }
       }
    }
}

#Preview {
    ContentView()
}
