//
//  Todo.swift
//  Todo List
//
//  Created by Rasmus Lindholm on 2024-01-16.
//

import Foundation

struct Todo:Identifiable {
    let id = UUID().uuidString
    let title: String
    var isDone = false
    var category: String?
}
