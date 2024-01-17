//
//  Todo.swift
//  Todo List
//
//  Created by Rasmus Lindholm on 2024-01-16.
//

import Foundation

struct Todo: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isDone = false
}

