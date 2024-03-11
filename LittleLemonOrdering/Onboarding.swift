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
    @State var regDisabled = true
    @State private var isEmailValid = false
    @State private var isLoggedin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedin) {
                    EmptyView()
                }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                Button("Register") {
                    UserDefaults.standard.set(firstName, forKey: GlobalVariables.kFirstName)
                    UserDefaults.standard.set(lastName, forKey: GlobalVariables.kLastName)
                    UserDefaults.standard.set(email, forKey: GlobalVariables.kemail)
                    
                    isLoggedin = true
                    UserDefaults.standard.setValue(isLoggedin, forKey: GlobalVariables.kIsLoggedIn)
                    
                }
                .disabled(firstName.isEmpty || lastName.isEmpty || email.isEmpty || !email.isValidEmail)
                .onAppear {
                    if UserDefaults.standard.bool(forKey: GlobalVariables.kIsLoggedIn) {
                        isLoggedin = true
                    }
                }
                    
            }
        }
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
