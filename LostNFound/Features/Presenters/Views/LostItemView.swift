//
//  LostItemView.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

import SwiftUI

struct LostItemView: View {
    let rankedImageSet = findRankedImageSet(targetImage: UIImage(named: "DompetLost")!, imagesSet: [UIImage(named: "DompetFound1")!, UIImage(named: "DompetFound2")!, UIImage(named: "DompetFound3")!, UIImage(named: "DompetFound4")!, UIImage(named: "DompetFound5")!, UIImage(named: "DompetFound6")!, UIImage(named: "DompetFound7")!])
    var body: some View {
        VStack{
            HStack{
                ItemImage().padding(48)
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 17) {
                            Text("Dompet Pink")
                                .font(.custom(AppFonts.helveticaNeue, size: 25))
                                .bold()
                            Text("Dompet pink seukuran telapak tangan merk Cath Kidston")
                                .font(.custom(AppFonts.helveticaNeue, size: 20))
                        }
                        Spacer()
                        ProcessButton()
                            .padding(.leading, 30)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.157)
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
                                Text("Valuable")
                            }
                            Divider()
                            HStack {
                                Text("Location")
                                    .bold()
                                Spacer()
                                Text("MRT Dukuh Atas")
                            }
                            Divider()
                            
                            HStack {
                                Text("Lost Date")
                                    .bold()
                                Spacer()
                                Text("12 July 2023")
                            }
                        }
                        .font(.custom(AppFonts.helveticaNeue, size: 18))
                        .frame(width: UIScreen.main.bounds.width * 0.382, height: UIScreen.main.bounds.height * 0.157)
                        Spacer()
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
                Text("7 out of 15")
                    .font(.custom(AppFonts.helveticaNeue, size: 15))
                    .bold()
                    .padding(.trailing, 20)
            }
            ScrollView(.vertical){
                LazyVGrid(columns: gridItems) {
                    ForEach(rankedImageSet.chunks(of: 3).indices, id: \.self) { index in
                        HStack(spacing: 15) {
                            let (image, _) = rankedImageSet[index]
                            VStack {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text("Rank: \(index + 1)")
                            }
                        }
                        
                    }
                }
                
            }
            Spacer()
        }
        .navigationBarTitle("")
        .toolbar(content: {
            ToolbarItem(id: "title", placement: .navigationBarLeading) {
                Text("Lost #88")
                    .foregroundColor(.white)
                    .font(.custom(AppFonts.helveticaNeue, size: 50))
                    .bold()
                    .padding(.top, 17)
                    .padding(.leading, 17)
            }
        })
        .toolbarBackground(AppColor.blueNavigationBar, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    var gridItems: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    }
}

func findRankedImageSet(targetImage: UIImage, imagesSet: [UIImage]) -> [(UIImage, Double)] {
    // Calculate the similarity for each item in the imagesSet and sort them by similarity
    let rankedImageSet = imagesSet.map { image -> (UIImage, Double) in
        let similarity = calculateMSE(targetImage, image) // You can also use calculateSSIM if needed
        return (image, similarity)
    }.sorted(by: { $0.1 < $1.1 })
    
    return rankedImageSet
}

struct LostItemView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemView().previewInterfaceOrientation(.landscapeLeft)
    }
}
