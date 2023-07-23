//
//  ImageClassifier.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/23/23.
//

import Foundation
import Vision
import CoreImage
import UIKit

class ImageClassifier: ObservableObject{
    var shared = createImageClassifier ()
    @Published var result : String = ""
    
    static func createImageClassifier () -> VNCoreMLModel{
        let defaultConfig = MLModelConfiguration ()
        
        let imageClassifierWrapper = try? LostAndFoundClassifier (configuration: defaultConfig)
        
        guard let imageClassifier = imageClassifierWrapper else{
            fatalError ("Failed to create an ML Model instance")
        }
        let imageClassifierModel = imageClassifier.model
        guard let imageClassifierVisionModel = try? VNCoreMLModel (for: imageClassifierModel) else{
            fatalError ("Failed to create VNCoreMLModel Instance")
        }
        return imageClassifierVisionModel
    }
    
    func processImage (for image : CIImage) {
        let imageClassificationRequest = VNCoreMLRequest(model: shared)
        let handler = VNImageRequestHandler(ciImage: image, orientation: .up)
        let requests : [VNRequest] = [imageClassificationRequest]
        try? handler.perform(requests)
        guard let observations = imageClassificationRequest.results as?
            [VNClassificationObservation] else{
            print("VNRequest produced the wrong result type :",(type(of:
                imageClassificationRequest.results)))
            return
        }
        if let firstResult = observations.first{
            self.result = firstResult.identifier
            print(self.result)
        }
    }
    static func getResult(selectedImage: UIImage) -> String{
        let classifyImage = ImageClassifier()
        let ciImage = CIImage(image: selectedImage)!
        classifyImage.processImage(for: ciImage)
        
        return classifyImage.result
//        itemName = classificationResult
    }
}
