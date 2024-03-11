//
//  OnboardingTextViews.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct OnboardingTextViews: View {
    var titleText: String
    var bodyText: String
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(titleText)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                Spacer()
            }
            Text(bodyText)
                .font(.title3)
                .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    OnboardingTextViews(titleText: "This is the title", bodyText: "This is the body")
}
