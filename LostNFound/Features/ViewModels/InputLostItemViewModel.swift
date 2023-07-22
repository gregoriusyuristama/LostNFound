//
//  InputLostItemViewModel.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/22/23.
//

import Foundation
import SupabaseStorage

class InputLostItemViewModel: ObservableObject {
    @Published var allItems: [ItemLnF] = [ItemLnF]()
    @Published var isLoading: Bool = false
    
    private let supabase = SupabaseManager()
    
    init() {}
    
    func fetchFoundItems(){
        Task {
            do {
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                let allItemFoundsDTO: [ItemLnF.DTO] = try await supabase.client.database
                    .from(TableNames.lostItemTable)
                    .select()
                    .execute()
                    .value
                let allItemFounds = try allItemFoundsDTO.map { try $0.toDomain() }
                DispatchQueue.main.async {
                    self.allItems = allItemFounds
                    self.isLoading = false
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func uploadImage(item: ItemLnF, imageData: Data){
        Task {
            do{
                let file = File(name: item.id!.uuidString, data: imageData, fileName: "\(item.id!.uuidString).jpg", contentType: "image/jpeg")
               let _ = try await supabase.storage.from(id: StorageNames.foundItemImageStorage).upload(path: "\(item.id!.uuidString).jpg", file: file, fileOptions: FileOptions(cacheControl: "3600"))
            } catch {
                print(error)
            }
            
        }
    }
    
    func addItem(item: ItemLnF, imageData: Data, completion: @escaping (_ status: Bool, _ error: Error?) -> Void) {
        do {
            let itemDTO = try item.toDTO()
            Task {
                DispatchQueue.main.async {
                    self.isLoading = true
                }
                try await supabase.client.database
                    .from(TableNames.lostItemTable)
                    .insert(values: itemDTO, returning: .representation)
                    .single()
                    .execute()
                    .value
                uploadImage(item: item, imageData: imageData)
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                completion(true, nil)
            }
            
        }
        catch {
            print(error.localizedDescription)
            completion(false, error)
        }
        
    }
}
