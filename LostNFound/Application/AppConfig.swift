//
//  AppConfig.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/20/23.
//

import Foundation

class AppConfig {
    var supabaseAPIKey: String {
        return getApiKey()
    }
    var supabaseEndpoint: String{
        return getEndPoint()
    }
    
    var secret: String {
        return getSecret()
    }
    
    private func getSecret() -> String {
        guard let filePath = Bundle.main.path(forResource: "Supabase-Info", ofType: "plist") else {
              fatalError("Couldn't find file 'Supabase-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "SECRET") as? String else {
            fatalError("Couldn't find key 'SECRET' in 'Supabase-Info.plist'.")
        }
        return value
    }
    
    private func getApiKey() -> String {
        guard let filePath = Bundle.main.path(forResource: "Supabase-Info", ofType: "plist") else {
            fatalError("Couldn't find file 'Supabase-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key 'API_KEY' in 'Supabase-Info.plist'.")
        }
        return value
    }
    
    private func getEndPoint() -> String {
        guard let filePath = Bundle.main.path(forResource: "Supabase-Info", ofType: "plist") else {
            fatalError("Couldn't find file 'Supabase-Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "ENDPOINT") as? String else {
            fatalError("Couldn't find key 'ENDPOINT' in 'Supabase-Info.plist'.")
        }
        return value
    }
}

enum AppError: Error, LocalizedError {
    case clientError(Error?)
    case clientErrorWithDescription(String)
    
    var errorDescription: String {
        switch self {
        case .clientError(let err):
            return NSLocalizedString(
                err != nil ? err?.localizedDescription ?? "Client error." : "Client error.",
                comment: "Failed to get data."
            )
        case .clientErrorWithDescription(let string):
            return string
        }
    }
}
