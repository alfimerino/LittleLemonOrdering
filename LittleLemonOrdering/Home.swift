//
//  Home.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI

struct Home: View {
    private let persistance = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistance.container.viewContext)
                .tabItem { Label("Menu", systemImage: "list.dash") }
            UserProfile()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
