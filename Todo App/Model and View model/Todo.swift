//
//  Todo.swift
//  Todo App
//
//  Created by Mena Haitham on 08/08/2023.
//
import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID()
    var task: String
    var subtask = ""
    var isCompleted = false
    var dueDate: Date? = nil
}
