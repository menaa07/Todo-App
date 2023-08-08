//
//  ContentView.swift
//  Todo App
//
//  Created by Mena Haitham on 08/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todos = [
        Todo(title: "Wakeup at 7 am"),
        Todo(title: "Water the plants"),
        Todo(title: "Study swift"),
        Todo(title: "Finish my homework", isCompleted: true),
        Todo(title: "Feed the cat"),
        Todo(title: "Attend meeting")
        
        
    ]
    var body: some View {
        NavigationStack {
            List($todos) { $todo in
                
                HStack {
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                }
                .navigationTitle("Todos")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
