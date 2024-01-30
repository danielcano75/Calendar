//
//  LoginHeader.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 29/01/24.
//

import SwiftUI

struct LoginHeader: View {
    private struct Constant {
        static let title = "Hello! 👋🏼"
        static let subtitle = "Enter your detail below"
    }
    
    var body: some View {
        VStack {
            Text(Constant.title)
                .font(.title)
            Text(Constant.subtitle)
                .font(.caption)
        }
    }
}

#Preview {
    LoginHeader()
}
