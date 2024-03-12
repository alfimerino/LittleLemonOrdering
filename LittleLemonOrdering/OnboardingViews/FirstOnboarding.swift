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
                OnboardingPrimeImage(imageName: "ordering")
                OnboardingTextViews(titleText: "Can't get to us? We'll come to you!", bodyText: "Enjoy your favorites from the comfort of wherever you are!")
                NavigationLink(destination: SecondOnboarding()) {
                    YellowButtonTextView()
                }.clipShape(.capsule)
                    .navigationBarBackButtonHidden(true)
            }
            .onAppear {
                UserDefaults.standard.setValue(false, forKey: GlobalVariables.kIsLoggedIn)
            }
        }
    }
}

#Preview {
    FirstOnboarding()
}
