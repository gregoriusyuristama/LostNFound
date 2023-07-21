//
//  Constants.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/17/23.
//

import Foundation

class Constants {
    init () {}
    static var uniqueKey: String {
        UUID().uuidString
    }
    static let options: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Dhil"),
        DropdownOption(key: uniqueKey, value: "Icho"),
        DropdownOption(key: uniqueKey, value: "Syifa"),
        DropdownOption(key: uniqueKey, value: "Theo"),
        DropdownOption(key: uniqueKey, value: "Sekar"),
        DropdownOption(key: uniqueKey, value: "Tiffany"),
        
    ]
}
class TableNames {
    init () {}
    static let foundItemTable = "FoundItem"
}

class StorageNames {
    init () {}
    
    static let foundItemImageStorage = "ItemFoundImage"
    static let foundItemImageURL = "https://wdivfbdgewrynyhgxyep.supabase.co/storage/v1/object/public/ItemFoundImage/"
    
    
}
