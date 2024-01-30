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
        static let iconHeight: CGFloat = 30.0
    }
    
    var iconName: String
    var title: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(title)
                    .fontWeight(.bold)
            }
            .padding(.vertical, Constant.verticalPadding)
            .frame(maxWidth: .infinity)
            .background(AppColor.fieldBackground)
            .foregroundColor(AppColor.Text.accent)
            .clipShape(RoundedRectangle(cornerRadius: Constant.cornerRadious))
        }

    }
}

#Preview {
    SSOButton(iconName: "Google-Icon", title: "Sign In with Google") {}
}
