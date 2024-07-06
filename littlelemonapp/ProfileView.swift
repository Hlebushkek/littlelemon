//
//  ProfileView.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct ProfileView: View {
    private var customer: Customer?
    
    @State private var firstName: String = "FirstName"
    @State private var lastName: String = "LastName"
    @State private var email: String = "email@email.com"
    @State private var phoneNumber: String = "+123456789"
    
    @State private var orderStatus: Bool = true
    @State private var passwordChange: Bool = false
    @State private var specialOffers: Bool = true
    @State private var newsletter: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Personal Information:")
                .font(.title2.bold())
            
            VStack(alignment: .leading) {
                Text("Avatar")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                HStack(spacing: 24) {
                    Image("Profile")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(.rect(cornerRadius: 32))
                    Button { } label: {
                        Text("Change")
                    }.buttonStyle(PrimaryButtonStyle())

                    Button { } label: {
                        Text("Remove")
                    }.buttonStyle(SecondaryButtonStyle())
                }
            }
            
            VStack(alignment: .leading, spacing: 24) {
                TitledTextField(title: "First name", value: $firstName)
                TitledTextField(title: "Last name", value: $lastName)
                TitledTextField(title: "Email", value: $email)
                TitledTextField(title: "Phone number", value: $phoneNumber)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Email notifications")
                    .font(.title2.bold())
                
                Toggle(isOn: $orderStatus) { Text("Order statues") }
                Toggle(isOn: $passwordChange) { Text("Password changes") }
                Toggle(isOn: $specialOffers) { Text("Special offers") }
                Toggle(isOn: $newsletter) { Text("Newsletter") }
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            .foregroundStyle(Color.approvedGreen)
            
            Button(action: {}, label: {
                HStack {
                    Text("Log out")
                }.frame(maxWidth: .infinity)
            }).buttonStyle(MainFocusButtonStyle())
            
            VStack {
                HStack(spacing: 32) {
                    Button(action: {}, label: {
                        Text("Discard changes")
                    }).buttonStyle(SecondaryButtonStyle())
                    Button(action: {}, label: {
                        Text("Save changes")
                    }).buttonStyle(PrimaryButtonStyle())
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

extension ProfileView {
    struct TitledTextField: View {
        var title: String
        
        @Binding var value: String
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
                TextField(title, text: $value)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }
}

#Preview {
    ScrollView {
        ProfileView()
            .padding(.horizontal)
    }
}
