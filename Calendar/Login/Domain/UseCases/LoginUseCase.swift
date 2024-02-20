//
//  LoginUseCase.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 13/02/24.
//

import Foundation
 
protocol LoginUseCase {
    func execute(with typeService: AuthTypeService) async throws
}
 
class DefaultLoginUseCase: LoginUseCase {
    func execute(with typeService: AuthTypeService) async throws {
        let service = AuthServiceFactory.create(with: typeService)
        try await service.login()
    }
}
