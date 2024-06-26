//
//  BondToDoListApp.swift
//  BondToDoList
//
//  Created by Scholar on 5/4/24.
//

import SwiftUI
import SwiftData

@main
struct BondToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: toDoItem.self)
        }
    }
}
