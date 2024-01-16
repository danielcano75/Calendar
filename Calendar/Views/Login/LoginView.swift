//
//  LoginView.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 26/12/23.
//

import SwiftUI

struct LoginView: View {
    private struct Constant {
        static let spacing = 20.0
        static let horizontalPadding = 10.0
        static let verticaPadding = 10.0
        static let cornerRadious = 10.0
        
        struct LoginHeader {
            static let paddingTop = 40.0
            static let paddingBottom = 20.0
        }
        
        struct LoginForm {
            static let titleEmail = "E-mail"
            static let iconEmail = "envelope"
            static let placeholderEmail = "Enter your email"
            
            static let titlePassword = "Password"
            static let iconPassword = "lock.rectangle"
            static let placeholderPassword = "Enter your password"
            
            static let subtitleForgotPassword = "Forgot password?"
            
            static let titleSignInBtn = "Sign In"
            static let subtitleConinue = "Or Continue with"
        }
    }
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea(.all)
            VStack(spacing: Constant.spacing) {
                LoginHeader()
                    .padding(.top, Constant.LoginHeader.paddingTop)
                    .padding(.bottom, Constant.LoginHeader.paddingBottom)
                
                FormField(title: Constant.LoginForm.titleEmail,
                          icon: Constant.LoginForm.iconEmail,
                          placeholder: Constant.LoginForm.placeholderEmail,
                          autorizationFieldType: .email,
                          text: $email)
                
                FormField(title: Constant.LoginForm.titlePassword,
                          icon: Constant.LoginForm.iconPassword,
                          placeholder: Constant.LoginForm.placeholderPassword,
                          autorizationFieldType: .password,
                          text: $password)
                
                HStack(content: {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text(Constant.LoginForm.subtitleForgotPassword)
                            .font(.caption)
                    })
                    .padding(.trailing, Constant.horizontalPadding)
                })
                
                Button(action: {
                    
                }, label: {
                    Text(Constant.LoginForm.titleSignInBtn)
                        .fontWeight(.bold)
                        .foregroundStyle(AppColor.Text.black)
                })
                .padding(.vertical, Constant.horizontalPadding)
                .frame(maxWidth: .infinity)
                .background(AppColor.accent)
                .clipShape(RoundedRectangle(cornerRadius: Constant.cornerRadious))
                
                Text(Constant.LoginForm.subtitleConinue)
                    .padding(.vertical, Constant.verticaPadding)
                
                Spacer()
            }
            .foregroundColor(AppColor.tint)
            .padding(.horizontal, Constant.horizontalPadding)
        }
    }
}

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
    LoginView()
}
