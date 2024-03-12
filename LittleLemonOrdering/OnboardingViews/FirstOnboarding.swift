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
                UserDefaults.standard.setValue("", forKey: GlobalVariables.kFirstName)
                UserDefaults.standard.setValue("", forKey: GlobalVariables.kLastName)
                UserDefaults.standard.setValue("", forKey: GlobalVariables.kemail)
            }
        }
    }
}

#Preview {
    FirstOnboarding()
}


/*
 private let firstName: String = UserDefaults.standard.string(forKey: GlobalVariables.kFirstName) ?? "Jenna"
 
 private let lastName: String = UserDefaults.standard.string(forKey: GlobalVariables.kLastName) ?? "Boynton"
 
 private let email: String = UserDefaults.standard.string(forKey: GlobalVariables.kemail) ?? "info@jenna.com"
 */
