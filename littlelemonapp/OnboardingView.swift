//
//  OnboardingView.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct OnboardingView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            HeroView()
                .padding()
                .background(Color.approvedGreen)
            
            VStack(spacing: 32) {
                VStack(alignment: .leading, spacing: 24) {
                    TitledTextField(title: "First name", value: $firstName)
                    TitledTextField(title: "Last name", value: $lastName)
                    TitledTextField(title: "Email", value: $email)
                }
                
                Button(action: {}, label: {
                    HStack {
                        Text("Register")
                    }.frame(maxWidth: .infinity)
                }).buttonStyle(MainFocusButtonStyle())
            }.padding()
            
            Spacer()
        }
        .padding(.top, 0.5)
    }
}

#Preview {
    OnboardingView()
}
