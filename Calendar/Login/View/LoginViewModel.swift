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
    
    func processGoogleSignInPressed() {
        let clientId = InfoPlistType.googleCloud.value(for: "CLIENT_ID")
        let config = GIDConfiguration(clientID: clientId)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
            print("\(String(describing: result))")
        }
    }
}
