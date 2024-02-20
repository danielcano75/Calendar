//
//  Application+Windows.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 13/02/24.
//

import UIKit

extension UIApplication {
    func firstWindow() -> UIWindow? {
        let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        let activeScene = windowScenes.filter { $0.activationState == .foregroundActive }
        let firstActiveScene = activeScene.first
        let keyWindow = firstActiveScene?.keyWindow
        return keyWindow
    }
}
