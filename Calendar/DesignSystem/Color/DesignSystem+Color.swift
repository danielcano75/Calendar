//
//  DesignSystem+Color.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 5/03/24.
//

import SwiftUI

extension DesignSystem {
    enum AppColor {
        enum State {
            static let cancelled = Color("AmpleOrange")
            static let outgoing = Color("SleekCyan")
            static let pending = Color("GreatMagenda")
            static let completed = accent
        }
        enum Text {
            static let black = Color("Background")
            static let accent = Color("AccentText")
        }
        enum Icon {
            static let grey = Color("GreyIcon")
            static let tint = Text.accent
            static let background = fieldBackground
        }
        static let background = Color("Background")
        static let accent = Color("Accent")
        static let tint = Color("Ash")
        static let fieldBackground = Color("FieldBackground")
        static let sleekCyan = Color("SleekCyan")
    }
}
