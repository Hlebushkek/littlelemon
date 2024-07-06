//
//  littlelemonappApp.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

@main
struct littlelemonappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
