//
//  todo manager.swift
//  Todo App
//
//  Created by Mena Haitham on 26/08/2023.
//

import Foundation
import SwiftUI

class TodoManager: ObservableObject {
    @Published var todos: [Todo] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func loadSampleData() {
        todos = [Todo(task: "Wake Up"),
                 Todo(task: "Feed the pet",
                      subtask: "prepare cat food", isCompleted: true),
                 Todo(task: "Get ready"),
                 Todo(task: "Complete SAP Units",
                     subtask: "Unit 7 project")]
    }
    
    func getArchiveURL() -> URL {
        let plistName = "todos.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(todos)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let todosDecoded = try? propertyListDecoder.decode([Todo].self, from: retrievedTodoData) {
            todos = todosDecoded
        }
    }
}
