//
//  SupabaseManager.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/20/23.
//

import Foundation
import Supabase

class SupabaseManager {
    private let config: AppConfig
    let client: SupabaseClient
    
    lazy var storage = SupabaseStorageClient(url: "https://wdivfbdgewrynyhgxyep.supabase.co/storage/v1", headers: [
        "Authorization" : "Bearer \(config.secret)",
        "apiKey" : config.supabaseAPIKey
    ])
    
    init(config: AppConfig = AppConfig()) {
        guard let url = URL(string: config.supabaseEndpoint) else { fatalError() }
        self.config = config
        self.client = SupabaseClient(supabaseURL: url, supabaseKey: config.supabaseAPIKey)
    }
}
