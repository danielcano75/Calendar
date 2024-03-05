//
//  SSOButton.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 29/01/24.
//

import SwiftUI

struct SSOButton: View {
    struct Constant {
        static let cornerRadious: CGFloat = 10.0
        static let verticalPadding: CGFloat = 10.0
        static let iconPadding: CGFloat = 5.0
    }
    
    var iconName: String
    var title: String
    var tintColor: Color? = nil
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                ZStack {
                    if let color = tintColor {
                        Image(iconName)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tint(color)
                    } else {
                        Image(iconName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .padding(Constant.iconPadding)
                
                Text(title)
                    .fontWeight(.bold)
            }
            .padding(.vertical, Constant.verticalPadding)
            .frame(maxWidth: .infinity)
            .background(DesignSystem.AppColor.fieldBackground)
            .foregroundColor(DesignSystem.AppColor.Text.accent)
            .clipShape(RoundedRectangle(cornerRadius: Constant.cornerRadious))
        }

    }
}

#Preview {
    SSOButton(iconName: "Google-Icon", title: "Sign In with Google") {}
}
