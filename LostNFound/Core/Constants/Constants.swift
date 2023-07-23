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
    
    static let allStationNames: [String : String] = [
        "Stasiun Lebak Bulus Grab" : "Lebak B.",
        "Stasiun Haji Nawi" : "Haji N.",
        "Stasiun ASEAN" : "ASEAN",
        "Stasiun Bendungan Hilir" : "Benhil",
        "Stasiun Bundaran HI" : "BHI",
        "Stasiun Blok A" : "Blok A",
        "Stasiun Senayan" : "Senayan",
        "Stasiun Setiabudi Astra" : "Setiabudi",
        "Stasiun Cipete Raya" : "Cipete",
        "Stasiun Blok M BCA" : "Blok M",
        "Stasiun Istora Mandiri" : "Istora",
        "Stasiun Dukuh Atas BNI" : "Dukuh A.",
        "Stasiun Fatmawati Indomaret" : "Fatma",
    ]
    
    static let allCategory: [String] = [
        "Valuable - Cash",
        "Valuable - Electronic",
        "Valuable - Jewelry",
        "Valuable - Keys",
        "Valuable - Wallets and Personal Identification",
        "Valuable - Documents",
        "Non-valueable - Books and Stationary",
        "Non-valueable - Make-up/Cosmetics",
        "Non-valueable - Clothing",
        "Perishable - Food",
        "Perishable - Drinks",
    ]
}
class TableNames {
    init () {}
    static let foundItemTable = "FoundItem"
    static let lostItemTable = "LostItem"
}

class StorageNames {
    init () {}
    
    static let foundItemImageStorage = "ItemFoundImage"
    static let lostItemImageStorage = "ItemLostImage"
    static let foundItemImageURL = "https://wdivfbdgewrynyhgxyep.supabase.co/storage/v1/object/public/ItemFoundImage/"
    static let lostItemImageURL = "https://wdivfbdgewrynyhgxyep.supabase.co/storage/v1/object/public/ItemLostImage/"
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
        "Non-Valueable": [
            "Books and Stationary",
            "Make-up/Cosmetics",
            "Clothing"
        ],
        "Perishable" : [
            "Food",
            "Drinks"
        ],
    ]
    
}


