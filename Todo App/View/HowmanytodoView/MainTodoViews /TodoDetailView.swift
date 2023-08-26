//
//  TodoDetailView.swift
//  Todo App
//
//  Created by Mena Haitham on 26/08/2023.
//
import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: Todo
    
    // Create a non-optional binding for the dueDate
    var nonOptionalDueDateBinding: Binding<Date> {
        Binding<Date>(
            get: { todo.dueDate ?? Date() },
            set: { newValue in
                todo.dueDate = newValue
            }
        )
    }
    
    var body: some View {
        Form {
            TextField("Enter Task", text: $todo.task)
            TextField("Enter Sub task", text: $todo.subtask)
            Toggle("Completed task?", isOn: $todo.isCompleted)
            
            // Use the non-optional binding for the DatePicker
            DatePicker("Due Date", selection: nonOptionalDueDateBinding, displayedComponents: [.date])
        }
        .navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(task: "some task")))
    }
}
