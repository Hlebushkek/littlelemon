//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Hlib Sobolevskyi on 2024-07-02.
//

import SwiftUI

@main
struct littlelemonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
