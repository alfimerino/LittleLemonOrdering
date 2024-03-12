//
//  LittleLemonOrderingApp.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI

@main
struct LittleLemonOrderingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: GlobalVariables.kIsLoggedIn) {
                Menu()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                FirstOnboarding()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
