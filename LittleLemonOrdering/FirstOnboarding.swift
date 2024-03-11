//
//  FirstOnboarding.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct FirstOnboarding: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack {
                    Image(.littleLemon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                    Image(.chicago)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 90)
                }
                Image(.ordering)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 500)
                    .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 20)))
                Divider()
                HStack {
                    Text("Can't get to us? We'll come to you!")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                }
                Text("Enjoy your favorites from the comfort of wherever you are!")
                    .font(.title3)
                    .padding(.horizontal)
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    Text("Next")
                        .foregroundStyle(Color.black)
                        .font(.title3)
                        .bold()
                        .padding(.vertical)
                        .padding(.horizontal, 60)
                        .background(Color.littleLemonYellow)
                }.clipShape(.capsule)
            }
        }
    }
}

#Preview {
    FirstOnboarding()
}
