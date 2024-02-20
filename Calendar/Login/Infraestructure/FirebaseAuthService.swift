//
//  FirebaseAuthService.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 12/02/24.
//

import Foundation
import FirebaseAuth
 
class FirebaseAuthService {
    enum Error: Swift.Error {
        case authError
    }
    
    private let credentials: Credentials
    
    init(credentials: Credentials) {
        self.credentials = credentials
    }
}
 
extension FirebaseAuthService: AuthService {
    func login() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { (result, error) in
                if let error {
                    debugPrint(error.localizedDescription)
                    continuation.resume(throwing: Error.authError)
                } else {
                    continuation.resume()
                }
            }
        }
    }
}
