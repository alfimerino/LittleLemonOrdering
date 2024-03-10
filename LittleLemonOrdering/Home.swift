//
//  Home.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem { Label("Menu", systemImage: "list.dash") }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}