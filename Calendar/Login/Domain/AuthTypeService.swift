//
//  AuthTypeService.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 20/02/24.
//

import Foundation

enum AuthTypeService {
    case firebase(credentials: Credentials)
    case google
}
