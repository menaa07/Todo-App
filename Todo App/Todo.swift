//
//  Todo.swift
//  Todo App
//
//  Created by Mena Haitham on 08/08/2023.
//

import Foundation

struct Todo: Identifiable {
    
    var id = UUID()
    var title: String
    var isCompleted = false
}
