//
//  LoginFactory.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 29/01/24.
//

import SwiftUI

enum LoginFactory {
    static func create() -> some View {
        let useCase = DefaultLoginUseCase()
        let viewModel = LoginViewModel(loginUseCase: useCase)
        let view = LoginView(viewModel: viewModel)
        return view
    }
}
