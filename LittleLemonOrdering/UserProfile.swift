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
    
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image("profile-image-placeholder", label: Text("Jenna"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 160)
                .clipShape(Circle())
            
            Text(firstName)
            Text(lastName)
            Text(email)
            
            Button("Log Out") {
                UserDefaults.standard.setValue(false, forKey: GlobalVariables.kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
