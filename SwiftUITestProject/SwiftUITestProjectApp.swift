//
//  SwiftUITestProjectApp.swift
//  SwiftUITestProject
//
//  Created by Kolesnikov Dmitry on 17.08.2021.
//

import SwiftUI

@main
struct SwiftUITestProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
