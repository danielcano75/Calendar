//
//  AuthType.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 20/02/24.
//

import Foundation

enum AuthType {
    case credentials(credentials: Credentials)
    case google
}
