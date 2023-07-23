//
//  LostItemViewModel.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/23/23.
//

import Foundation
import UIKit
import SwiftUI

class LostItemViewModel: ObservableObject {
    @Published var allFoundItems: [ItemFound] = [ItemFound]()
    @Published var isLoading: Bool = true
    @Published var rankedImages: [(UIImage, Double)] = [(UIImage, Double)]()
    @Published var allFoundImages: [UIImage] = [UIImage]()
    
    private let supabase = SupabaseManager()
    private var listUrl = [String]()
    
    init() {
    }
    
    typealias ImageFetchCompletion = ([UIImage]?) -> Void
    
    
    func fetchFoundItems(completion: @escaping ()->()){
        Task {
            do {
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                let allItemFoundsDTO: [ItemFound.DTO] = try await supabase.client.database
                    .from(TableNames.foundItemTable)
                    .select()
                    .execute()
                    .value
                let allItemFounds = try allItemFoundsDTO.map { try $0.toDomain() }
                DispatchQueue.main.async {
                    self.allFoundItems = allItemFounds
                    for item in self.allFoundItems {
                        self.listUrl.append(item.imageURL.absoluteString)
                    }
                    self.fetchImagesFromURLs(self.listUrl) { fetchedImages in
                        if let fetchedImages = fetchedImages {
                            self.allFoundImages = fetchedImages
                            self.isLoading = false
                            completion()
                        }
                    }
                    
//                    self.convertToUIImage()
//                    self.fetchImagesFromURLs(<#T##urls: [String]##[String]#>, completion: <#T##ImageFetchCompletion##ImageFetchCompletion##([UIImage]?) -> Void#>)
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
//
//    func convertToUIImage() {
//        for item in allFoundItems {
//            DispatchQueue.global().async {
//                let data = (try? Data(contentsOf: item.imageURL))!
//                self.allFoundImages.append(UIImage(data: data)!)
//            }
//        }
//    }
//
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
    
    func findRankedImageSet(targetImage: UIImage, imagesSet: [UIImage]) -> [(UIImage, Double)]{
        // Calculate the similarity for each item in the imagesSet and sort them by similarity
//        self.isLoading = true
        return imagesSet.map { image -> (UIImage, Double) in
            print("cekRankedImages")
            print("Target Image : \(targetImage)")
            print(image)
            let similarity = calculateMSE(targetImage, image) // You can also use calculateSSIM if needed
            return (image, similarity)
        }.sorted(by: { $0.1 < $1.1 })
//        DispatchQueue.main.async {
//
////            self.isLoading = false
//        }
        
//         = rankedImageSet
//        self.isLoading = false
        
    }
    
    func fetchImagesFromURLs(_ urls: [String], completion: @escaping ImageFetchCompletion) {
        // Initialize an array to store the fetched images
        var fetchedImages: [UIImage] = []
        
        // Create a dispatch group to wait for all images to be fetched
        let imageFetchGroup = DispatchGroup()
        
        for urlString in urls {
            if let imageURL = URL(string: urlString) {
                imageFetchGroup.enter()
                URLSession.shared.dataTask(with: imageURL) { imageData, _, _ in
                    if let imageData = imageData, let image = UIImage(data: imageData) {
                        fetchedImages.append(image)
                    }
                    imageFetchGroup.leave()
                }.resume()
            }
        }
        
        // Wait for all images to be fetched before completing
        imageFetchGroup.notify(queue: .main) {
            completion(fetchedImages)
        }
    }
    
}
