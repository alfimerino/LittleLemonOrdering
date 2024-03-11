//
//  FirstOnboarding.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct FirstOnboarding: View {
    @State private var isLoggedin = false
    var body: some View {
        NavigationStack {
            VStack {
                OnboardingHeaderView()
                NavigationLink(destination: Home(), isActive: $isLoggedin) {
                    EmptyView()
                }
                OnboardingPrimeImage(imageName: "ordering")
                OnboardingTextViews(titleText: "Can't get to us? We'll come to you!", bodyText: "Enjoy your favorites from the comfort of wherever you are!")
                NavigationLink(destination: SecondOnboarding()) {
                    YellowButtonTextView()
                }.clipShape(.capsule)
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: GlobalVariables.kIsLoggedIn) {
                    isLoggedin = true
                }
            }
        }
    }
}

#Preview {
    FirstOnboarding()
}
