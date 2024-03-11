//
//  ThirdOnboarding.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct ThirdOnboarding: View {
    var body: some View {
        NavigationStack {
            VStack {
                OnboardingHeaderView()
                OnboardingPrimeImage(imageName: "eating")
                OnboardingTextViews(titleText: "Your profile for fast ordering!", bodyText: "Share the love for Little Lemon.. We don't share your details.")
                NavigationLink(destination: Onboarding()) {
                    YellowButtonTextView()
                }.clipShape(.capsule)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ThirdOnboarding()
}
