//
//  HeroView.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Little Lemon")
                .font(.markazi(size: 48).bold())
                .foregroundStyle(Color.approvedYellow)
            
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Chicago")
                        .font(.markazi(size: 36))
                        .fontWeight(.semibold)
                    
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.markazi(size: 18))
                        .fontWeight(.medium)
                }
                
                Spacer(minLength: 8)
                
                Image("Hero image")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 160)
                    .clipShape(.rect(cornerRadius: 12))
            }
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    HeroView()
        .padding()
        .background(Color.approvedGreen)
}
