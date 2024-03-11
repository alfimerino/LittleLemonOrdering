//
//  YellowButtonTextView.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct YellowButtonTextView: View {
    var body: some View {
        Text("Next")
            .foregroundStyle(Color.black)
            .font(.title3)
            .bold()
            .padding(.vertical)
            .padding(.horizontal, 60)
            .background(Color.littleLemonYellow)
    }
}

#Preview {
    YellowButtonTextView()
}
