//
//  Howmanytodoview.swift
//  Todo App
//
//  Created by Mena Haitham on 26/08/2023.
//

import SwiftUI

struct HowManyTodoView: View {
    @ObservedObject var todoManager : TodoManager
    
    var itemsDone : Int {
        todoManager.todos.filter {$0.isCompleted}.count
    }
    
    var itemsNotDone : Int {
        todoManager.todos.filter {!$0.isCompleted}.count
    }
    
    var body: some View {
        VStack{
                Text("^[You have completed \(itemsDone) tasks](inflect:true)")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            /* .onAppear{
             for todo in todoManager.todos {
             if todo.isCompleted {
             itemsDone += 1
             }
             }
             } */
            Text("^[You have to complete \(itemsNotDone) tasks](inflect:true)")
                .padding()
        }
    }
}

struct HowManyTodoView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyTodoView(todoManager: TodoManager())
    }
}
