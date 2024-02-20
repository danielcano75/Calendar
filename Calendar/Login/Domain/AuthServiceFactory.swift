//
//  AuthServiceFactory.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 20/02/24.
//

import Foundation

enum AuthServiceFactory {
    static func create(with typeService: AuthTypeService) -> AuthService {
        switch typeService {
        case .firebase(let credentials):
            return FirebaseAuthService(credentials: credentials)
        case .google:
            return GoogleSignInService()
        }
    }
}
