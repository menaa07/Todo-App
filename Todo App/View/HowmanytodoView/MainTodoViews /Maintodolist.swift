//
//  Maintodolist.swift
//  Todo App
//
//  Created by Mena Haitham on 26/08/2023.
//
// ... existing code

import SwiftUI

struct MainTodoList: View {
    @ObservedObject var todoManager : TodoManager
    @State var showAddSheet = false
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todoManager.todos) { $todo in
                    if !todo.isCompleted {  // Corrected line here
                        NavigationLink {
                            TodoDetailView(todo: $todo)
                        } label: {
                            HStack {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .onTapGesture {
                                        todo.isCompleted.toggle()
                                    }
                                VStack(alignment: .leading) {
                                    Text(todo.task)
                                        .strikethrough(todo.isCompleted)
                                    Text(todo.subtask)
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .strikethrough(todo.isCompleted)
                                }
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    todoManager.todos.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("ToDos")
            .navigationBarItems(
                leading: EditButton(),
                trailing: HStack {
                    #if DEBUG
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "clipboard.fill")
                    }
                    #endif
                    
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            )
            .sheet(isPresented: $showAddSheet) {
                NewTodoView(sourceArray: $todoManager.todos)
            }
            .alert("Do you want to replace the sample data?",isPresented: $showAlert) {
                Button("Replace?", role:.destructive) {
                    todoManager.loadSampleData()
                }
            }
        }
    }
}

struct MainTodoList_Previews: PreviewProvider {
    static var previews: some View {
        MainTodoList(todoManager: TodoManager())
    }
}
