//
//  LostItemView.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

import SwiftUI

struct LostItemView: View {
    //    let rankedImageSet = findRankedImageSet(targetImage: UIImage(named: "DompetLost")!, imagesSet: [UIImage(named: "DompetFound1")!, UIImage(named: "DompetFound2")!, UIImage(named: "DompetFound3")!, UIImage(named: "DompetFound4")!, UIImage(named: "DompetFound5")!, UIImage(named: "DompetFound6")!, UIImage(named: "DompetFound7")!])
    
    @Binding var item: ItemLost?
    
    @State var rankedImagesView: [(UIImage, Double)] = [(UIImage, Double)]()
    @State var isProcessing = false
    @ObservedObject var vm = LostItemViewModel()
    
    var body: some View {
        VStack{
            HStack{
                //                ItemImage(imageURL: item?.imageURL ?? URL(string: "")).padding(48)
                Rectangle()
                    .fill(.clear)
                    .frame(width: UIScreen.main.bounds.width*0.23, height: UIScreen.main.bounds.height*0.311)
                    .overlay {
                        AsyncImage(url: item?.imageURL) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width*0.23, height: UIScreen.main.bounds.height*0.311)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    .padding(48)
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 17) {
                            Text("\(item?.itemName ?? "")")
                                .font(.custom(AppFonts.helveticaNeue, size: 25))
                                .bold()
                            Text("\(item?.desc ?? "")")
                                .font(.custom(AppFonts.helveticaNeue, size: 20))
                        }
                        Spacer()
                        ProcessButton()
                            .padding(.leading, 30)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.157)
                    Spacer()
                    HStack {
                        VStack(alignment: .leading){
                            Text("Item Description")
                                .font(.custom(AppFonts.helveticaNeue, size: 25))
                                .bold()
                                .padding(.bottom, 17)
                            HStack {
                                Text("Category")
                                    .bold()
                                Spacer()
                                Text("\(item?.category ?? "")")
                            }
                            Divider()
                            HStack {
                                Text("Location")
                                    .bold()
                                Spacer()
                                Text("\(item?.locationFound ?? "")")
                            }
                            Divider()
                            
                            HStack {
                                Text("Lost Date")
                                    .bold()
                                Spacer()
                                Text("\(item?.dateFound?.shortDate() ?? "")")
                            }
                        }
                        .font(.custom(AppFonts.helveticaNeue, size: 18))
                        .frame(width: UIScreen.main.bounds.width * 0.382, height: UIScreen.main.bounds.height * 0.157)
                        Spacer()
                    }
                    
                }
                .onAppear{
                    self.isProcessing = true
                    vm.fetchFoundItems() {
                        if let url = item?.imageURL {
                            print(vm.allFoundImages)
                            print("Cekkkk")
                            print(url.absoluteString)
                            let imageFetchGroup = DispatchGroup()
                            imageFetchGroup.enter()
                            URLSession.shared.dataTask(with: url) { imageData, _, _ in
                                if let imageData = imageData, let image = UIImage(data: imageData) {
                                    vm.findRankedImageSet(targetImage: image, imagesSet: vm.allFoundImages)
                                    self.rankedImagesView = vm.rankedImages
                                    self.isProcessing = false
//                                    print(vm.rankedImages)
                                    
                                }
                                imageFetchGroup.leave()
                            }.resume()
                        }
                    }
                }
            }
            Divider()
            HStack{
                Spacer()
                Text("Match Item")
                    .font(.custom(AppFonts.helveticaNeue, size: 30))
                    .bold()
                Spacer()
                //                Text("7 out of 15")
                //                    .font(.custom(AppFonts.helveticaNeue, size: 15))
                //                    .bold()
                //                    .padding(.trailing, 20)
            }
            ZStack {
                ProgressView()
                    .opacity(isProcessing ? 1 : 0)
                ScrollView(.vertical){
                    LazyVGrid(columns: gridItems) {
                        ForEach(rankedImagesView.indices , id: \.self) { index in
                            let (image, _) = rankedImagesView[index]
                            VStack {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200)
                                Text("Rank: \(index + 1)")
                            }
                            
                        }
                    }
                    Spacer()
                }
                .opacity(isProcessing ? 0 : 1)
            }
            
            .navigationBarTitle("")
            .toolbar(content: {
                ToolbarItem(id: "title", placement: .navigationBarLeading) {
                    if let id = item?.id {
                        let uuidString = id.uuidString
                        let start = uuidString.index(uuidString.endIndex, offsetBy: -3)
                        let end = uuidString.index(uuidString.endIndex, offsetBy: 0)
                        let range = start..<end
                        let newId = uuidString[range]
                        Text("Lost #\(newId.description)")
                            .foregroundColor(.white)
                            .font(.custom(AppFonts.helveticaNeue, size: 50))
                            .bold()
                            .padding(.bottom, 28)
                    }
                    
                }
            })
            .toolbarBackground(AppColor.blueNavigationBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        var gridItems: [GridItem] {
            Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
        }
    }
}

//func findRankedImageSet(targetImage: UIImage, imagesSet: [UIImage]) -> [(UIImage, Double)] {
//    // Calculate the similarity for each item in the imagesSet and sort them by similarity
//    let rankedImageSet = imagesSet.map { image -> (UIImage, Double) in
//        let similarity = calculateMSE(targetImage, image) // You can also use calculateSSIM if needed
//        return (image, similarity)
//    }.sorted(by: { $0.1 < $1.1 })
//
//    return rankedImageSet
//}

struct LostItemView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemView(item: .constant( ItemLost(itemName: "", category: "", locationFound: "", currentLocation: "", dateFound: Date(), desc: "", lastModified: Date(), personInCharge: "", phoneNumber: "", idFoundItem: ""))) .previewInterfaceOrientation(.landscapeLeft)
    }
}
