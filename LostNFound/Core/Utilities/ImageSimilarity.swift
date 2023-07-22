//
//  ImageSimilarity.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

import UIKit
import CoreGraphics

func calculateMSE(_ image1: UIImage, _ image2: UIImage) -> Double {
    guard let data1 = image1.jpegData(compressionQuality: 1.0),
          let data2 = image2.jpegData(compressionQuality: 1.0) else {
        return Double.greatestFiniteMagnitude
    }
    
    guard let cgImage1 = UIImage(data: data1)?.cgImage,
          let cgImage2 = UIImage(data: data2)?.cgImage else {
        return Double.greatestFiniteMagnitude
    }
    
    let width = min(cgImage1.width, cgImage2.width)
    let height = min(cgImage1.height, cgImage2.height)
    let dataSize = width * height * 4
    
    let buffer1 = malloc(dataSize)
    let buffer2 = malloc(dataSize)
    
    let context1 = CGContext(data: buffer1, width: width, height: height, bitsPerComponent: 8, bytesPerRow: width * 4, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
    let context2 = CGContext(data: buffer2, width: width, height: height, bitsPerComponent: 8, bytesPerRow: width * 4, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)!
    
    context1.draw(cgImage1, in: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
    context2.draw(cgImage2, in: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
    
    var sum: Double = 0.0
    
    for y in 0..<height {
        for x in 0..<width {
            let pixelIndex = (width * y + x) * 4
            let r1 = Int(buffer1!.load(fromByteOffset: pixelIndex, as: UInt8.self))
            let g1 = Int(buffer1!.load(fromByteOffset: pixelIndex + 1, as: UInt8.self))
            let b1 = Int(buffer1!.load(fromByteOffset: pixelIndex + 2, as: UInt8.self))
            
            let r2 = Int(buffer2!.load(fromByteOffset: pixelIndex, as: UInt8.self))
            let g2 = Int(buffer2!.load(fromByteOffset: pixelIndex + 1, as: UInt8.self))
            let b2 = Int(buffer2!.load(fromByteOffset: pixelIndex + 2, as: UInt8.self))
            
            let diffR = r1 - r2
            let diffG = g1 - g2
            let diffB = b1 - b2
            
            sum += Double(diffR * diffR + diffG * diffG + diffB * diffB)
        }
    }
    
    free(buffer1)
    free(buffer2)
    
    let count = Double(width * height)
    return sum / count
}

func findMostSimilarImage(targetImage: UIImage, imagesSet: [UIImage]) -> UIImage? {
    var mostSimilarImage: UIImage?
    var smallestMSE = Double.greatestFiniteMagnitude
    
    for image in imagesSet {
        let mse = calculateMSE(targetImage, image)
        if mse < smallestMSE {
            smallestMSE = mse
            mostSimilarImage = image
        }
    }
    
    return mostSimilarImage
}


