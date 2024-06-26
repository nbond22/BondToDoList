//
//  ContentView.swift
//  BondToDoList
//
//  Created by Scholar on 5/4/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    
    @Query var toDos: [toDoItem]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        
        VStack{
            
            //to do text and add button
            HStack{
                Text("To-Do List")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                Spacer()
                
                Button {
                    withAnimation {
                        self.showNewTask = true
                    }
                } label: {
                    Text("+")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.orange)
                }
            }
            .padding()
            Spacer()
            
            List {
                ForEach(toDos) { toDoItem in
                    if toDoItem.isImportant == true {
                        Text("‼️" + toDoItem.title)
                    } else {
                        Text(toDoItem.title)
                    }
                    
                }
                .onDelete(perform: deleteToDo)
                
                
                if showNewTask {
                    NewToDoView(showNewTask: $showNewTask, toDoItem: toDoItem(title: "", isImportant: false))
                }
                
            }
            .listStyle(.plain)
            
        }
        
    }

    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    ContentView()
}
