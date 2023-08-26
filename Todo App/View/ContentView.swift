//
//  ContentView.swift
//  Todo App
//
//  Created by Mena Haitham on 08/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var todoManagerMaster = TodoManager()

    var body: some View {
        TabView {
            MainTodoList(todoManager: todoManagerMaster)
                .tabItem {
                    Label("Todos", systemImage: "checkmark.circle")
                }
            HowManyTodoView(todoManager: todoManagerMaster)
                .tabItem {
                    Label("How Many todos?", systemImage: "number.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
