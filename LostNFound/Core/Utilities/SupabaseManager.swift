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
    
    private let secret = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkaXZmYmRnZXdyeW55aGd4eWVwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4OTU2NTMxOCwiZXhwIjoyMDA1MTQxMzE4fQ.kVcdHedMgzR2Ya4sLslBRtYbecBi2zMGr4kRlC0bTp4"
    
    lazy var storage = SupabaseStorageClient(url: "https://wdivfbdgewrynyhgxyep.supabase.co/storage/v1", headers: [
        "Authorization" : "Bearer \(secret)",
        "apiKey" : config.supabaseAPIKey
    ])
    
    init(config: AppConfig = AppConfig()) {
        guard let url = URL(string: config.supabaseEndpoint) else { fatalError() }
        self.config = config
        self.client = SupabaseClient(supabaseURL: url, supabaseKey: config.supabaseAPIKey)
        Task{
            do {
                try await print(self.client.storage.listBuckets())
            }
            catch{
                print(error)
            }
           
            
        }
    }

//    func storageClient(bucketName: String = StorageNames.foundItemImageStorage) async -> StorageFileApi? {
//        guard let jwt = try? await client.auth.session.accessToken else { return nil}
//        return SupabaseStorageClient(
//            url: "\(config.supabaseEndpoint)/storage/v1",
//            headers: [
//                "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndkaXZmYmRnZXdyeW55aGd4eWVwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY4OTU2NTMxOCwiZXhwIjoyMDA1MTQxMzE4fQ.kVcdHedMgzR2Ya4sLslBRtYbecBi2zMGr4kRlC0bTp4",
//                "apikey": config.supabaseAPIKey,
//            ]
//        ).from(id: bucketName)
//    }
}
