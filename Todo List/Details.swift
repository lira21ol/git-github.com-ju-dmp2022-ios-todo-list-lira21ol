//
//  Details.swift
//  Todo List
//
//  Created by Rasmus Lindholm on 2024-01-17.
//

import SwiftUI

struct Details: View {
    var todo: Todo
    
    var body: some View {
        VStack {
            Text("Todo :)")
                .font(.largeTitle)
                .padding()

            Text("Title: \(todo.title)")
                .padding()
            
            
       Spacer()
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(todo: Todo(title: "My new todo"))
    }
}
