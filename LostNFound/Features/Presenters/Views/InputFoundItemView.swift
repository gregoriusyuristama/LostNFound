//
//  InputFormView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/20/23.
//

import SwiftUI

struct InputFoundItemView: View {
    @State private var locationFound = ""
    @State private var currentLocation = ""
    @State private var dateFound = Date()
    @State private var itemDesc = ""
    @State private var personInCharge = ""
    @State private var image: UIImage?
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @StateObject private var vm = InputFoundItemViewModel()
    var body: some View {
        ZStack {
            ProgressView()
                .opacity(vm.isLoading ? 1 : 0)
            Form{
                Section{
                    TextField("Location Found", text: $locationFound)
                    TextField("Current Location", text: $currentLocation)
                    DatePicker("Select a date", selection: $dateFound, displayedComponents: .date)
                    TextField("Item Description", text: $itemDesc)
                    TextField("Person In Charge", text: $personInCharge)
                }
                
                Button {
                    
                } label: {
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } else {
                        
                        HStack{
                            Button{
                                showImagePicker = true
                                sourceType = .photoLibrary
                            } label: {
                                Image(systemName: "photo")
                                    .font(.title)
                            }
                            Button{
                                showImagePicker = true
                                sourceType = .camera
                            }label: {
                                Image(systemName: "camera")
                                    .font(.title)
                            }
                        }
                    }
                }
                .sheet(isPresented: $showImagePicker){
                    ImagePicker(uiImage: $selectedImage, isPresenting: $showImagePicker, sourceType: $sourceType)
                }
                Button {
                    let newItem = ItemFound(itemName: "", locationFound: self.locationFound, currentLocation: self.currentLocation, dateFound: self.dateFound, desc: self.itemDesc, lastModified: Date(), personInCharge: self.personInCharge, phoneNumber: "")
                    vm.addItem(item: newItem, imageData: (selectedImage?.jpegData(compressionQuality: 0.5))!) { status, error in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        } else {
                            resetForm()
                        }
                    }
                } label: {
                    Text("Submit")
                }
                
            }
            
            .opacity(vm.isLoading ? 0 : 1)
        }
        
    }
    func resetForm() {
        self.locationFound = ""
        self.currentLocation = ""
        self.dateFound = Date()
        self.itemDesc = ""
        self.personInCharge = ""
        self.selectedImage = nil
    }
}

struct InputFormView_Previews: PreviewProvider {
    static var previews: some View {
        InputFoundItemView()
    }
}
