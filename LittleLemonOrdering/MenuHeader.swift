//
//  MenuHeader.swift
//  LittleLemonOrdering
//
//  Created by Alfredo Merino on 3/11/24.
//

import SwiftUI

struct MenuHeader: View {
    var body: some View {
        ZStack {
            Color.littleLemonGreen
            HStack {
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .fontDesign(.serif)
                        .foregroundStyle(Color.littleLemonYellow)
                        .font(.title)
                        .bold()
                    Text("Chicago")
                        .fontDesign(.serif)
                        .foregroundStyle(Color.white)
                        .font(.title3)
                        .bold()
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist")
                        .foregroundStyle(Color.white)
                        .padding(.top)
                }.frame(width: 200)
                    .padding(.leading)
                Spacer()
                Image(.thumbnaillittlelemon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180)
            }
            .padding(.horizontal, 16)
        }.frame(height: 240)
        
        
    }
}

#Preview {
    MenuHeader()
}
