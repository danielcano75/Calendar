//
//  LoginView.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 26/12/23.
//

import SwiftUI
import GoogleSignInSwift

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
            
            static let googleIconName = "Google-Icon"
            static let googleButtonTitle = "Sign In with Google"
            
            static let appleIconName = "Apple-Icon"
            static let appleButtonTitle = "Sign In with Apple"
        }
    }
    
    @State var viewModel: any LoginViewModelType
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            DesignSystem.AppColor.background.ignoresSafeArea(.all)
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
                        viewModel.processForgotPasswordPressed()
                    }, label: {
                        Text(Constant.LoginForm.subtitleForgotPassword)
                            .font(.caption)
                    })
                    .padding(.trailing, Constant.horizontalPadding)
                })
                
                Button(action: {
                    viewModel.processSignInPressed()
                }, label: {
                    Text(Constant.LoginForm.titleSignInBtn)
                        .fontWeight(.bold)
                        .foregroundStyle(DesignSystem.AppColor.Text.black)
                })
                .padding(.vertical)
                .frame(maxWidth: .infinity, maxHeight: DesignSystem.DefaultDimension.Button.height)
                .background(DesignSystem.AppColor.accent)
                .clipShape(RoundedRectangle(cornerRadius: Constant.cornerRadious))
                
                Text(Constant.LoginForm.subtitleConinue)
                    .padding(.vertical, Constant.verticaPadding)
                
                SSOButton(iconName: Constant.LoginForm.googleIconName,
                          title: Constant.LoginForm.googleButtonTitle) {
                    viewModel.processGoogleSignInPressed()
                }
                .frame(maxHeight: DesignSystem.DefaultDimension.Button.height)
                
                SSOButton(iconName: Constant.LoginForm.appleIconName,
                          title: Constant.LoginForm.appleButtonTitle,
                          tintColor: DesignSystem.AppColor.Icon.grey) {
                    
                }
                .frame(maxHeight: DesignSystem.DefaultDimension.Button.height)
                
                Spacer()
            }
            .foregroundColor(DesignSystem.AppColor.tint)
            .padding(.horizontal, Constant.horizontalPadding)
        }
    }
}

#Preview {
    class PreviewLoginViewModel: LoginViewModelType {
        var email: String = ""
        var password: String = ""
        
        func processSignInPressed() {
            print("preview signin")
        }
        
        func processForgotPasswordPressed() {
            print("preview forgotpasword")
        }
        
        func processGoogleSignInPressed() {
            print("preview google signin")
        }
    }
    let viewModel = PreviewLoginViewModel()
    return LoginView(viewModel: viewModel)
}
