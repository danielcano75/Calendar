//
//  LoginViewModel.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 29/01/24.
//

import SwiftUI
import FirebaseAuth

protocol LoginViewModelType: ObservableObject {
    var email: String { set get }
    var password: String { set get }
    
    func processSignInPressed()
    func processForgotPasswordPressed()
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
    
    func processSignInPressed() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard let self else {
                print("Instance Error!")
                return
            }
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("Login con crendenciales: \(self.email) y \(self.password)")
        }
    }
    
    func processForgotPasswordPressed() {
        print("Forgot password con correo \(email)")
    }
}
