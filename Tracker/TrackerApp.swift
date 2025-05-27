//
//  TrackerApp.swift
//  Tracker
//
//  Created by Thais Canguçu on 27/05/25.
//

import SwiftUI

@main
struct TrackerApp: App {
    @StateObject private var coreDataController = CoreDataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataController.persistentContainer.viewContext)
        }
    }
}
