//
//  AuthService.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 12/02/24.
//

import Foundation
 
struct Credentials {
    let email: String
    let password: String
}
 
protocol AuthService {
    func login() async throws
}
