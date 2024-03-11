//
//  SearchBar.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                self.text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview {
    SearchBar(text: .constant("Text"))
}
