//
//  OnboardingPrimeImage.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct OnboardingPrimeImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 360, height: 500)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 20)))
        Divider()
    }
}

#Preview {
    OnboardingPrimeImage(imageName: "ordering")
}
