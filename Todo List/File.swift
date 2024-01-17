//
//  File.swift
//  Todo List
//
//  Created by Rasmus Lindholm on 2024-01-17.
//

import Foundation

struct Category: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var todos: [Todo] = []
}
