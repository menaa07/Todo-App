//
//  NewtodoView.swift
//  Todo App
//
//  Created by Mena Haitham on 26/08/2023.
//
import SwiftUI

struct NewTodoView: View {
    @State var todoTask = ""
    @State var todosubTask = ""
    @Binding var sourceArray: [Todo]
    @Environment(\.dismiss) var dismiss
    
    @State private var showErrorAlert = false
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Enter the task", text : $todoTask)
                TextField("Enter sub task", text: $todosubTask)
            }
            
            Section("Actions") {
                Button("Save") {
                    if !todoTask.isEmpty {
                        let todo = Todo(task: todoTask, subtask: todosubTask)
                        sourceArray.append(todo)
                        dismiss()
                    } else {
                        showErrorAlert = true
                    }
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(
                        title: Text("Missing Task"),
                        message: Text("Please enter a task title before saving."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sourceArray: .constant([]))
    }
}
