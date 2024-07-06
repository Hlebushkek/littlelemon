//
//  MainButtonStyles.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct MainFocusButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.approvedYellow)
            .foregroundColor(.black)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.orange, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.approvedGreen)
            .foregroundColor(.white)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .foregroundColor(Color.approvedGreen)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.approvedGreen, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

#Preview {
    VStack {
        Button("Primary") { }
            .buttonStyle(MainFocusButtonStyle())
        
        Button("Primary") { }
            .buttonStyle(PrimaryButtonStyle())
        
        Button("Secondary") { }
            .buttonStyle(SecondaryButtonStyle())
    }
}
