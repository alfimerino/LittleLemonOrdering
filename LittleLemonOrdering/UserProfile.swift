//
//  UserProfile.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    private let firstName: String = UserDefaults.standard.string(forKey: GlobalVariables.kFirstName) ?? "Jenna"
    
    private let lastName: String = UserDefaults.standard.string(forKey: GlobalVariables.kLastName) ?? "Boynton"
    
    private let email: String = UserDefaults.standard.string(forKey: GlobalVariables.kemail) ?? "info@jenna.com"
    @State private var logOut = false
    
    var body: some View {
        VStack(alignment: .center) {
            OnboardingHeaderView()
            Text("Personal Information")
                .font(.title)
                .bold()
            Image("profile-image-placeholder", label: Text("Jenna"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 160)
                .clipShape(Circle())
            HStack(alignment: .center) {
                Text(firstName)
                    .font(.title)
                Text(lastName)
                    .font(.title)
            }
            Text(email)
                .font(.title3)
            NavigationLink(destination: FirstOnboarding()) {
                YellowButtonTextView(buttonText: "Log out")
                    .clipShape(Capsule())
                    .padding(.top, 30)
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
