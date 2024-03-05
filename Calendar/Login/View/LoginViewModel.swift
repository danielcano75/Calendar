//
//  LoginViewModel.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 29/01/24.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

protocol LoginViewModelType: ObservableObject {
    var email: String { set get }
    var password: String { set get }
    
    func processSignInPressed()
    func processForgotPasswordPressed()
    func processGoogleSignInPressed()
}

class LoginViewModel: LoginViewModelType {
    private struct Constant {
        struct Email {
            static let initialValue = ""
        }
        struct Password {
            static let initialValue = ""
        }
    }
    
    var email: String = Constant.Email.initialValue
    var password: String = Constant.Password.initialValue
    private let loginUseCase: LoginUseCase
    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    func processSignInPressed() {
        Task {
            do {
                let credentials = Credentials(email: email, password: password)
                loginUseCase.set(authType: .credentials(credentials: credentials))
                try await loginUseCase.execute()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func processForgotPasswordPressed() {
        print("Forgot password con correo \(email)")
    }
    
    func processGoogleSignInPressed() {
        Task {
            do {
                loginUseCase.set(authType: .google)
                try await loginUseCase.execute()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
