//
//  ReportFoundPage.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/21/23.
//

import SwiftUI
import Vision

struct ReportFoundPage: View {
    let geo: GeometryProxy
    @State private var itemName: String = ""
    @State private var phoneNumber: String = ""
    @State private var date: Date = Date()
    @State private var location: String?
    @State private var category: String?
    @State private var desc: String = ""
    @FocusState private var isTextEditorFocused: Bool
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var errorMessage: String = ""
    @State private var reportNumber: String = ""
    
    @State private var isShowingErrorSheet = false
    @State private var isShowingSubmitSheet = false
    @State private var showImagePicker = false
    
    @StateObject private var vm = InputFoundItemViewModel()
    
    @State private var translatedColorName: String = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button {
                    showImagePicker = true
                } label: {
                    if let selectedImage = selectedImage {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.5)
                            .cornerRadius(20)
                            .padding(.horizontal, 70)
                            .foregroundColor(.white)
                            .overlay {
                                Image(uiImage: selectedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.5)
                            }
                        
                    }else {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.5)
                            .cornerRadius(20)
                            .foregroundColor(AppColor.defaultGray)
                            .padding(.horizontal, 70)
                    }
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(uiImage: $selectedImage, isPresenting: $showImagePicker, sourceType: $sourceType)
                }.onChange(of: selectedImage) { newImage in
                    if let image = newImage {
                        getResult(selectedImage: image)
                        let uicolor = image.preciseAverageColor()
                        let itemColor = uicolor!.accessibilityName
                        translatedColorName = translateColorToIndonesian(itemColor)
                        itemName.append(" " + translatedColorName)
                    }
                }
                VStack{
                    Group {
                        TextField("Item Name", text: $itemName)
                        TextField("Phone Number", text: $phoneNumber)
                            .keyboardType(.numberPad)
                        CustomDatePicker(selectedDate: $date)
                        CustomDropdownMenu(selectedOption: $location, options: Constants.allStationNames, placeholder: "Location")
                        CustomDropdownMenu(selectedOption: $category, options: Constants.allCategory, placeholder: "Category")
                        TextEditor(text: $desc)
                            .frame(height: geo.size.height * 0.15)
                            .overlay {
                                if desc == "" && !isTextEditorFocused{
                                    HStack {
                                        VStack {
                                            Text("Item Description")
                                                .foregroundColor(Color(uiColor: UIColor.lightGray))
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            .focused($isTextEditorFocused)
                    }
                    .textFieldStyle(.plain)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color.black, lineWidth: 1)
                    })
                    .datePickerStyle(.compact)
                    .font(.custom(AppFonts.helveticaNeue, size: 20))
                    .padding(.bottom, 10)
                }
            }
            .tint(.blue)
            .padding(.trailing, geo.size.width * 0.1)
            .padding(.top, geo.size.height * 0.05)
            
            SubmitButton(doSubmit: {
                if checkForm() {
                    isShowingSubmitSheet = true
                    let newItem = ItemLnF(itemName: self.itemName, locationFound: self.location, currentLocation: self.location, dateFound: self.date, desc: self.desc, lastModified: Date(), personInCharge: "Icho", phoneNumber: self.phoneNumber)
                    reportNumber = newItem.id?.uuidString ?? "000"
                    vm.addItem(item: newItem, imageData: (self.selectedImage?.jpegData(compressionQuality: 0.5))!) { status, error in
                        if let error = error {
                            print(error.localizedDescription)
                        }else {
                            resetForm()
                        }
                    }
                } else {
                    
                        isShowingErrorSheet = true
                }
                
            }
            )
            .sheet(isPresented: $isShowingSubmitSheet){
                ZStack {
                    ProgressView()
                        .opacity(vm.isLoading ? 1 : 0)
                    VStack {
                        Image(systemName: "checkmark.circle")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.blue)
                            .padding(.bottom, 60)
                        Group {
                            Text("Report Successfully Submitted\n")
                            Text("Report ID #\(reportNumber)")
                        }
                        .font(.custom(AppFonts.helveticaNeue, size: 34))
                        .fontWeight(.bold)
                        Button {
                            isShowingSubmitSheet = false
                        } label: {
                            Text("Done")
                                .font(.custom(AppFonts.helveticaNeue, size: 35))
                                .foregroundColor(.black)
                                .frame(width: UIScreen.main.bounds.width * 0.227, height: UIScreen.main.bounds.height * 0.072)
                                .background(AppColor.defaultGray)
                                .cornerRadius(20)
                        }
                        .padding(.top, 33)
                    }
                    .opacity(vm.isLoading ? 0 : 1)
                }
            }
            .sheet(isPresented: $isShowingErrorSheet) {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.red)
                    .padding(.bottom, 60)
                Group {
                    Text("Form not filled : ")
                    Text(errorMessage)
                }
                .font(.custom(AppFonts.helveticaNeue, size: 34))
                .fontWeight(.bold)
                Button {
                    isShowingErrorSheet = false
                } label: {
                    Text("OK")
                        .font(.custom(AppFonts.helveticaNeue, size: 35))
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width * 0.227, height: UIScreen.main.bounds.height * 0.072)
                        .background(AppColor.defaultGray)
                        .cornerRadius(20)
                }
                .padding(.top, 33)
            }
        }
    }
    private func resetForm() {
        self.selectedImage = nil
        self.itemName = ""
        self.phoneNumber = ""
        self.date = Date()
        self.desc = ""
        self.location = nil
        self.category = nil
    }
    private func checkForm() -> Bool{
        if itemName.isEmpty {
            errorMessage = "Item name field is empty"
            return false
        } else if self.desc.isEmpty {
            errorMessage = "Item desc field is empty"
            
            return false
        } else if self.location == nil {
            errorMessage = "Location field is empty"
            
            return false
        } else if self.category == nil {
            errorMessage = "Category field is empty"
            return false
        }
        return true
    }
    
    private func getResult(selectedImage: UIImage){
        let classifyImage = ImageClassifier()
        let ciImage = CIImage(image: selectedImage)!
        classifyImage.processImage(for: ciImage)
        
        let classificationResult = classifyImage.result
        itemName = classificationResult
    }
}


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
}

struct ReportFoundPage_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ReportFoundPage(geo: geo)
        }
    }
}
