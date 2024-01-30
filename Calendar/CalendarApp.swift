//
//  CalendarApp.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 26/12/23.
//

import SwiftUI
import Firebase

@main
struct CalendarApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginFactory.create()
        }
    }
}
