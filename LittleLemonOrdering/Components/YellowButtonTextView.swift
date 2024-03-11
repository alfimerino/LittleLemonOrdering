//
//  YellowButtonTextView.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct YellowButtonTextView: View {
    var buttonText: String? = "Next"
    var buttonDisabled = false
    var body: some View {
        Text(buttonText!)
            .foregroundStyle(Color.black)
            .font(.title3)
            .bold()
            .padding(.vertical)
            .padding(.horizontal, 60)
            .background(buttonDisabled ? Color.gray : Color.littleLemonYellow)
            .opacity(buttonDisabled ? 0.2 : 1.0)
    }
}

#Preview {
    YellowButtonTextView()
}
