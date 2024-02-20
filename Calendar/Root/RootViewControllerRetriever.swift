//
//  RootViewControllerRetriever.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 13/02/24.
//

import UIKit

struct RootViewControllerRetriever {
    static func retrieve() -> UIViewController? {
        guard let viewController = UIApplication.shared.firstWindow()?.rootViewController else {
            return nil
        }
        return viewController
    }
}
