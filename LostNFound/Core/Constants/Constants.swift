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
    
    static let stationNames: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Stasiun Lebak Bulus Grab"),
        DropdownOption(key: uniqueKey, value: "Stasiun Haji Nawi"),
        DropdownOption(key: uniqueKey, value: "Stasiun ASEAN"),
        DropdownOption(key: uniqueKey, value: "Stasiun Bendungan Hilir"),
        DropdownOption(key: uniqueKey, value: "Stasiun Bundaran HI"),
        DropdownOption(key: uniqueKey, value:  "Stasiun Blok A"),
        DropdownOption(key: uniqueKey, value: "Stasiun Senayan"),
        DropdownOption(key: uniqueKey, value:  "Stasiun Setiabudi Astra"),
        DropdownOption(key: uniqueKey, value:  "Stasiun Cipete Raya"),
        DropdownOption(key: uniqueKey, value:  "Stasiun Blok M BCA"),
        DropdownOption(key: uniqueKey, value:  "Stasiun Istora Mandiri"),
        DropdownOption(key: uniqueKey, value:  "Stasiun Dukuh Atas BNI"),
        DropdownOption(key: uniqueKey, value:  "Stasiun Setiabudi Astra"),
    ]
    
    static let allStationNames: [String] = [
        "Stasiun Lebak Bulus Grab",
        "Stasiun Haji Nawi",
        "Stasiun ASEAN",
        "Stasiun Bendungan Hilir",
        "Stasiun Bundaran HI",
        "Stasiun Blok A",
        "Stasiun Senayan",
        "Stasiun Setiabudi Astra",
        "Stasiun Cipete Raya",
        "Stasiun Blok M BCA",
        "Stasiun Istora Mandiri",
        "Stasiun Dukuh Atas BNI",
        "Stasiun Setiabudi Astra",
    ]
    
    static let allCategory: [String] = [
        "Valuable - Cash",
        "Valuable - Electronic",
        "Valuable - Jewelry",
        "Valuable - Keys",
        "Valuable - Wallets and Personal Identification",
        "Valuable - Documents",
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



class ItemCategory {
    init() {}
    
    
    
    static let category = [
        "Valueable": [
            "Cash",
            "Electronic",
            "Jewelry",
            "Keys",
            "Wallets and Personal Identification",
            "Documents"
        ],
        "Non-Valueable": ["Books and Stationary", "Make-up/Cosmetics", "Clothing"],
        "Perishable" : ["Food", "Drinks"],
    ]
    
}


