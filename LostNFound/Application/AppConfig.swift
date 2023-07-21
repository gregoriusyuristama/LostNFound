//
//  AppConfig.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/20/23.
//

import Foundation

class AppConfig {
    let supabaseAPIKey: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkaXZmYmRnZXdyeW55aGd4eWVwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk1NjUzMTgsImV4cCI6MjAwNTE0MTMxOH0.Bsxg6HtxHDmJv1nBxWXqr3SmSmxZ0PCQr5_ygHC_BTY"
    let supabaseEndpoint: String = "https://wdivfbdgewrynyhgxyep.supabase.co"
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
