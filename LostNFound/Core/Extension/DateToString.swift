//
//  DateToString.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/23/23.
//

import Foundation

extension Date {
    func shortDate() -> String {
        let formater = DateFormatter()
        formater.dateStyle = .short
        return formater.string(from: self)
    }
}
