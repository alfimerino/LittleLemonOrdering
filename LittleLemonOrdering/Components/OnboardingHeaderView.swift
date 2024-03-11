//
//  OnboardingHeaderView.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct OnboardingHeaderView: View {
    var body: some View {
        Image(.littleLemon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 40)
    }
}

#Preview {
    OnboardingHeaderView()
}
