//
//  ItemFoundModel.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/20/23.
//

import Foundation

struct ItemFound: Hashable, Identifiable, Codable {
    var id: UUID? = UUID()
    let itemName: String?
    let locationFound: String?
    let currentLocation: String?
    let dateFound: Date?
    var imageURL: URL {
        return URL(string: "\(StorageNames.foundItemImageURL)\(id!.uuidString).jpg")!
    }

//    let imageURL: URL?
    let desc: String?
    let lastModified: Date?
    let personInCharge: String?
    let phoneNumber: String?
    
    
    func toDTO() throws -> ItemFound.DTO{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        let dateFoundString = dateFormatter.string(from: dateFound!)
        let lastModifiedString = dateFormatter.string(from: lastModified!)
        
        return ItemFound.DTO(id: id, item_name: itemName, location_found: locationFound, current_location: currentLocation, date_found: dateFoundString, image: imageURL.absoluteString, desc: desc, last_modified: lastModifiedString, person_in_charge: personInCharge, phone_number: phoneNumber)
    }
}

extension ItemFound {
    struct DTO: Codable {
        let id: UUID?
        let item_name: String?
        let location_found: String?
        let current_location: String?
        let date_found: String?
        let image: String?
        let desc: String?
        let last_modified: String?
        let person_in_charge: String?
        let phone_number: String?
        
        func toDomain() throws -> ItemFound {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            guard let dateFound = dateFormatter.date(from: date_found!) else {
                throw AppError.clientErrorWithDescription("Date Found Error")
            }
            
            guard let last_modified = dateFormatter.date(from: last_modified!) else {
                throw AppError.clientErrorWithDescription("Last Modified Error")
            }
            return ItemFound(id: id, itemName: item_name, locationFound: location_found, currentLocation: current_location, dateFound: dateFound, desc: desc, lastModified: last_modified, personInCharge: person_in_charge, phoneNumber: phone_number)
        }
    }
}
