//
//  Home.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI

struct Home: View {
    private let persistance = PersistenceController.shared
    @AppStorage(GlobalVariables.kIsLoggedIn) private var isLoggedIn = false //
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                TabView {
                    Menu()
                        .tabItem { Label("Menu", systemImage: "list.dash") }
                    
                    UserProfile()
                        .tabItem { Label("Profile", systemImage: "square.and.pencil") }
                }
            } else {
                FirstOnboarding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
