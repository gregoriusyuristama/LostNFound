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
            BlueTitle()
            HStack{
                ItemImage().padding(70)
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Dompet Pink")
                                .font(.system(size: 50))
                                .bold()
                            
                            Text("Dompet pink seukuran telapak tangan merk Cath Kidston")
                                .font(.system(size: 30))
                        }
                        VStack{
                            ProcessButton()
                        }
                    }
                    Text("Item Description")
                        .font(.system(size: 50))
                        .bold()
                    VStack(alignment: .leading){
                        HStack{
                            Text("Category")
                                .font(.system(size: 30))
                                .bold()
                            Text("Valuable")
                                .font(.system(size: 30))
                        }
                        HStack{
                            Text("Location")
                                .font(.system(size: 30))
                                .bold()
                            Text("MRT Dukuh Atas")
                                .font(.system(size: 30))
                        }
                        HStack{
                            Text("Lost Date")
                                .font(.system(size: 30))
                                .bold()
                            Text("12 July 2023")
                                .font(.system(size: 30))
                        }
                    }
                }
            }
            HStack{
                Spacer()
                Text("Match Item")
                    .font(.system(size: 50))
                    .bold()
                Spacer()
                Text("7 out of 15")
                    .font(.system(size: 20))
            }
            HStack{
                ForEach(rankedImageSet.indices, id: \.self) { index in
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
            Spacer()
        }
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
