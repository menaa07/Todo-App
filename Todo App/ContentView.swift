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
    Todo(title: "Finish my homework"),
    Todo(title: "Feed the cat"),
    Todo(title: "Attend meeting")
        
    
    ]
    var body: some View {
        List(todos) { todo in
            Text(todo.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
