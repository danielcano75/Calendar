//
//  FormField.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 10/01/24.
//

import SwiftUI

enum AutorizationFieldType {
    case email
    case password
}

struct FormField: View {
    private struct Constant {
        struct Field {
            static let corner = 15.0
            static let iconSize = 20.0
        }
    }
    
    let title: String
    let icon: String
    let placeholder: String
    let autorizationFieldType: AutorizationFieldType
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.white)
            
            HStack {
                Image(systemName: icon).frame(width: Constant.Field.iconSize, height: Constant.Field.iconSize)
                
                switch autorizationFieldType {
                case .email:
                    TextField(placeholder, text: $text)
                        .keyboardType(.emailAddress)
                case .password:
                    PasswordField(text: $text, placeholder: placeholder)
                }
            }
            .padding()
            .background(DesignSystem.AppColor.fieldBackground)
            .cornerRadius(Constant.Field.corner)
            
        }
        .foregroundColor(DesignSystem.AppColor.tint)
    }
}

#Preview {
    FormField(title: "E-mail", 
              icon: "envelope",
              placeholder: "Enter your text",
              autorizationFieldType: .email,
              text: .constant(""))
}
