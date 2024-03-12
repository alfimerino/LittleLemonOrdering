//
//  Onboarding.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/10/24.
//

import SwiftUI

struct GlobalVariables {
    static let kFirstName = "first name key"
    static let kLastName = "last name key"
    static let kemail = "email key"
    static let kIsLoggedIn = "kIsLoggedIn"
}

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State private var isEmailValid = false
    @State private var isLoggedin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                OnboardingHeaderView()
                Spacer()
                VStack(spacing: 18) {
                    Text("Create your Account")
                        .font(.title)
                        .bold()
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        saveUserAccount()
                        self.isLoggedin = true
                    }) {
                        YellowButtonTextView(buttonText: "Register", buttonDisabled: buttonDisabled())
                            .clipShape(Capsule())
                            .padding(.top, 30)
                            .disabled(buttonDisabled())
                    }
                    NavigationLink(
                        destination: Menu(),
                        isActive: $isLoggedin
                    ) {
                        EmptyView()
                    }
                    .hidden()
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    private func buttonDisabled() -> Bool {
        if firstName.isEmpty || lastName.isEmpty || email.isEmpty || !email.isValidEmail {
           return true
        }
        return false
    }
    
    private func saveUserAccount() {
        UserDefaults.standard.set(firstName, forKey: GlobalVariables.kFirstName)
        UserDefaults.standard.set(lastName, forKey: GlobalVariables.kLastName)
        UserDefaults.standard.set(email, forKey: GlobalVariables.kemail)
    }
}

#Preview {
    Onboarding()
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
