//
//  AppColor.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 26/12/23.
//

import SwiftUI

struct AppColor {
    struct State {
        static let cancelled = Color("AmpleOrange")
        static let outgoing = Color("GreatMagenda")
        static let pending = accent
    }
    struct Text {
        static let black = Color("Background")
        static let accent = Color("AccentText")
    }
    static let background = Color("Background")
    static let accent = Color("Accent")
    static let tint = Color("Ash")
    static let fieldBackground = Color("FieldBackground")
}
