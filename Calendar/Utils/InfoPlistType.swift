//
//  InfoPlistType.swift
//  Calendar
//
//  Created by Daniel Cano Arbelaez on 5/02/24.
//

import Foundation

enum InfoPlistType {
    case main
    case googleCloud
    case credentials
    case googleService
    
    var name: String {
        switch self {
        case .main:
            return "Info"
        case .googleCloud:
            return "GoogleCloud-Info"
        case .credentials:
            return "credentials"
        case .googleService:
            return "GoogleService-Info"
        }
    }
    
    func value(for key: String) -> String {
        if let url = resolveGetURL() {
            let plist = resolveGetPropertyList(with: url)
            return plist[key] as? String ?? ""
        }
        return ""
    }
    
    private func resolveGetURL() -> URL? {
        guard let path = Bundle.main.path(forResource: self.name, ofType: "plist") else {
            return nil
        }
        let url = URL(filePath: path)
        return url
    }
    
    private func resolveGetPropertyList(with url: URL) -> [String : Any] {
        do {
            let data = try Data(contentsOf: url)
            guard let plist = try PropertyListSerialization.propertyList(from: data,
                                                                         options: .mutableContainers,
                                                                         format: nil) as? [String: Any] else {
                return [:]
            }
            return plist
        } catch {
            print("FILE NOT FOUND!")
        }
        return [:]
    }
}
