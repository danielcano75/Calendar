//
//  LoginUseCase.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 13/02/24.
//

import Foundation
 
protocol LoginUseCase {
    func set(authType: AuthType)
    func execute() async throws
}
 
class DefaultLoginUseCase: LoginUseCase {
    enum Error: Swift.Error {
        case missingAuthType
    }
    
    private var authType: AuthType?
    
    func set(authType: AuthType) {
        self.authType = authType
    }
    
    func createService() throws -> AuthService {
        guard let authType else {
            throw Error.missingAuthType
        }
        return AuthServiceFactory.create(with: authType)
    }
    
    func execute() async throws {
        let service = try createService()
        try await service.login()
    }
}
