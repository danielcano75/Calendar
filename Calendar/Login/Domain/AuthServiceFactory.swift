//
//  AuthServiceFactory.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 20/02/24.
//

import Foundation

enum AuthServiceFactory {
    static func create(with authType: AuthType) -> AuthService {
        switch authType {
        case .credentials(let credentials):
            return FirebaseAuthService(credentials: credentials)
        case .google:
            return GoogleSignInService()
        }
    }
}
