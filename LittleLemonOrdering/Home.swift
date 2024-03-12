//
//  Home.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI

struct Home: View {
    private let persistance = PersistenceController.shared
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: GlobalVariables.kIsLoggedIn)
    
    var body: some View {
        if isLoggedIn {
            Menu()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
        } else {
            FirstOnboarding()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    Home()
}
