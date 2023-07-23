//
//  ColorTracker.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 23/07/23.
//

import Foundation
import UIKit

extension UIImage {
    func preciseAverageColor() -> UIColor? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bytesPerPixel = 4
        let bytesPerRow = bytesPerPixel * Int(self.size.width)
        let imageData = UnsafeMutableRawPointer.allocate(byteCount: Int(self.size.height) * bytesPerRow, alignment: bytesPerPixel)
        defer {
            imageData.deallocate()
        }
        
        let context = CGContext(data: imageData,
                                width: Int(self.size.width),
                                height: Int(self.size.height),
                                bitsPerComponent: 8,
                                bytesPerRow: bytesPerRow,
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
        
        context.draw(self.cgImage!, in: CGRect(origin: .zero, size: self.size))
        
        var totalR: Double = 0
        var totalG: Double = 0
        var totalB: Double = 0
        
        for y in 0..<Int(self.size.height) {
            for x in 0..<Int(self.size.width) {
                let byteIndex = bytesPerRow * y + bytesPerPixel * x
                let red = Double(imageData.load(fromByteOffset: byteIndex + 0, as: UInt8.self))
                let green = Double(imageData.load(fromByteOffset: byteIndex + 1, as: UInt8.self))
                let blue = Double(imageData.load(fromByteOffset: byteIndex + 2, as: UInt8.self))
                totalR += red
                totalG += green
                totalB += blue
            }
        }
        
        let count = Double(self.size.width * self.size.height)
        let averageR = totalR / count
        let averageG = totalG / count
        let averageB = totalB / count
        
        return UIColor(red: CGFloat(averageR/255.0), green: CGFloat(averageG/255.0), blue: CGFloat(averageB/255.0), alpha: 1.0)
    }
}

func translateColorToIndonesian(_ colorName: String) -> String {
    let colorTranslations: [String: String] = [
        "red": "merah",
        "green": "hijau",
        "blue": "biru",
        "yellow": "kuning",
        "orange": "oranye",
        "pink": "pink",
        "purple": "ungu",
        "black": "hitam",
        "white": "putih",
        "gray": "abu-abu",
        "brown": "coklat",
        // Add more color translations as needed
    ]

    // Split the colorName into individual words
    let words = colorName.lowercased().components(separatedBy: .whitespaces)

    // Check each word for translation
    var translatedWords: [String] = []
    for word in words {
        if let translatedColor = colorTranslations[word] {
            translatedWords.append(translatedColor)
        } else {
            translatedWords.append(word)
        }
    }

    // Rejoin the translated words into the final translated color name
    let translatedColorName = translatedWords.joined(separator: " ")

    return translatedColorName
}
