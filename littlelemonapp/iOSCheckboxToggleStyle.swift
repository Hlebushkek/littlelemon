//
//  iOSCheckboxToggleStyle.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")

                configuration.label
            }
        })
    }
}

#Preview {
    Toggle("Toggle", isOn: .constant(true))
        .toggleStyle(iOSCheckboxToggleStyle())
}
