//
//  PasswordField.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 9/01/24.
//

import SwiftUI

struct PasswordField: View {
    private struct Constant {
        struct SecureButtonImage {
            static let passwordHidden = "eye.slash"
            static let passwordVisible = "eye"
            static let size = 20.0
        }
    }
    
    @State private var secure: Bool = true
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        Group {
            HStack {
                if $secure.wrappedValue {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
                Button(action: {
                    secure.toggle()
                }, label: {
                    Image(systemName: secure ? Constant.SecureButtonImage.passwordHidden : Constant.SecureButtonImage.passwordVisible)
                        .frame(width: Constant.SecureButtonImage.size,
                               height: Constant.SecureButtonImage.size)
                })
            }
        }
    }
}

#Preview {
    PasswordField(text: .constant("some-password"),
                  placeholder: "Insert your password")
}
