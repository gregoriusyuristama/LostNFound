//
//  LostItemNonImageView.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

import SwiftUI

struct ImageDescription: Hashable{
    let imageName: String
    let description: String
}

struct LostItemNonImageView: View {
    let imageDescriptions: [ImageDescription] = [
            ImageDescription(imageName: "JaketBiru1", description: "Jaket Biru"),
            ImageDescription(imageName: "JaketBiru2", description: "Jaket Biru"),
            ImageDescription(imageName: "JaketBiru3", description: "Jaket Biru"),
            ImageDescription(imageName: "JaketMerah1", description: "Jaket Merah"),
            ImageDescription(imageName: "JaketMerah2", description: "Jaket Merah"),
            ImageDescription(imageName: "JaketMerah3", description: "Jaket Merah"),
            ImageDescription(imageName: "JaketHijau1", description: "Jaket Hijau"),
            ImageDescription(imageName: "JaketHijau2", description: "Jaket Hijau"),
            ImageDescription(imageName: "JaketKuning", description: "Jaket Kuning"),
            ImageDescription(imageName: "JaketUngu", description: "Jaket Ungu"),
        ]
    let itemDesc = "Jaket biru tua dengan zipper"
    var body: some View {
        VStack{
            BlueTitle()
            HStack{
                ItemImage(imageName: "NoImage").padding(70)
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Jaket Hilang")
                                .font(.system(size: 50))
                                .bold()
                            
                            Text(itemDesc)
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
                            Text("Non Valuable")
                                .font(.system(size: 30))
                        }
                        HStack{
                            Text("Location")
                                .font(.system(size: 30))
                                .bold()
                            Text("MRT Bundaran HI")
                                .font(.system(size: 30))
                        }
                        HStack{
                            Text("Lost Date")
                                .font(.system(size: 30))
                                .bold()
                            Text("17 July 2023")
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
                Text("3 out of 10")
                    .font(.system(size: 20))
            }
            HStack {
                ForEach(imageDescriptions.filter { isWordInSentence($0.description, itemDesc) }, id: \.self) { imageDescription in
                    VStack{
                        Image(imageDescription.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Text(imageDescription.description)
                            .font(.headline)
                            .padding()
                    }
                }
            }
        }
    }
}

struct LostItemNonImageView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemNonImageView().previewInterfaceOrientation(.landscapeLeft)
    }
}
