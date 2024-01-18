//
//  ContentView.swift
//  Todo List
//
//  Created by Rasmus Lindholm on 2024-01-16.
//

import SwiftUI
struct ContentView: View {

    @State private var categories = [ Category (name: "Personal       👨‍💻"), Category(name: "Work             💼"), Category(name: "Shopping     💸")]
    @State private var textInput = ""
    @State private var newCategoryName = ""
    @State private var isCategorySelected = false

    var body: some View {
            NavigationView {
                VStack {
                    List {
                        ForEach(categories, id: \.id) { category in
                            NavigationLink(destination: CategoryView(category: category, categories: $categories)) {
                                Text(category.name)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            categories.remove(atOffsets: indexSet)
                            isCategorySelected = false
                        })
                    }

                    TextField("New category...", text: $newCategoryName)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()

                    Button("Add Category") {
                        if !newCategoryName.isEmpty {
                            categories.append(Category(name: newCategoryName))
                            newCategoryName = ""
                        }
                     }
                    .padding()


                    }
                
                .navigationTitle("✔Todo list✔")
                
                
                    
                }
              
            }
        }
    

struct CategoryView: View {
    var category: Category
    @Binding var categories: [Category]
    @State private var newTodoText = ""

    var body: some View {
        List {
            ForEach(category.todos) { todo in
                NavigationLink(destination: Details(todo: todo)) {
                    HStack {
                        Image(systemName: todo.isDone ? "checkmark.applewatch" : "applewatch")
                        Text(todo.title)
                    }
                }
                .onTapGesture {
                    if let categoryIndex = categories.firstIndex(where: { $0.id == category.id }),
                       let todoIndex = categories[categoryIndex].todos.firstIndex(where: { $0.id == todo.id }) {
                        categories[categoryIndex].todos[todoIndex].isDone.toggle()
                    }
                }
            }
            .onDelete(perform: { indexSet in
                if let categoryIndex = categories.firstIndex(where: { $0.id == category.id }) {
                    categories[categoryIndex].todos.remove(atOffsets: indexSet)
                }
            })

            TextField("New todo...", text: $newTodoText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .onSubmit {
                    if let categoryIndex = categories.firstIndex(where: { $0.id == category.id }), !newTodoText.isEmpty {
                        categories[categoryIndex].todos.append(Todo(title: newTodoText))
                        newTodoText = ""
                    }
                }
        }
        .navigationTitle("What todo? 🤔")
    }
        
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
