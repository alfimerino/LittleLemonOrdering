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
        Menu()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
