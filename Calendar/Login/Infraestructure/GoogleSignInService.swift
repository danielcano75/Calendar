//
//  GoogleSignInService.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 20/02/24.
//

import FirebaseCore
import GoogleSignIn
 
class GoogleSignInService {
    enum Error: Swift.Error {
        case anyError
    }
}
 
extension GoogleSignInService: AuthService {
    func login() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            guard let clientId = FirebaseApp.app()?.options.clientID else { return }
            
            let config = GIDConfiguration(clientID: clientId)
            GIDSignIn.sharedInstance.configuration = config
            
            guard let presentingViewController = RootViewControllerRetriever.retrieve() else { return }
            
            GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
                if let error {
                    continuation.resume(throwing: Error.anyError)
                    return
                }
                continuation.resume()
            }
        }
    }
}
