//
//  SecondOnboarding.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct SecondOnboarding: View {
    var body: some View {
        NavigationStack {
            VStack {
                OnboardingHeaderView()
                //MARK: For the life of me I could not keep the clip shape by reusing the element for OnboardingPrimeImage. It was taking way too long so I moved on.
                Image("kitchen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 360, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Divider()
                OnboardingTextViews(titleText: "Let us do all the cooking", bodyText: "Sit back and relax while we prepare something special just for you!")
                
                Spacer()
                NavigationLink(destination: ThirdOnboarding()) {
                    YellowButtonTextView()
                }.clipShape(.capsule)
            }
        }
    }
}

#Preview {
    SecondOnboarding()
}
