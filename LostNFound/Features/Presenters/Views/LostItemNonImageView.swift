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
            //            BlueTitle()
            HStack{
                ItemImage(imageName: "NoImage").padding(48)
                VStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading, spacing: 17){
                            Text("Jaket Hilang")
                                .font(.custom(AppFonts.helveticaNeue, size: 25))
                                .bold()
                            Text(itemDesc)
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
                            HStack{
                                Text("Category")
                                    .bold()
                                Spacer()
                                Text("Non Valuable")
                            }
                            Divider()
                            HStack{
                                Text("Location")
                                    .bold()
                                Spacer()
                                Text("MRT Bundaran HI")
                            }
                            Divider()
                            HStack{
                                Text("Lost Date")
                                    .bold()
                                Spacer()
                                Text("17 July 2023")
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
                Text("3 out of 10")
                    .font(.custom(AppFonts.helveticaNeue, size: 15))
                    .bold()
                    .padding(.trailing, 20)
            }
            ScrollView(.vertical){
                LazyVGrid(columns: gridItems) {                ForEach(imageDescriptions.filter { isWordInSentence($0.description, itemDesc) }, id: \.self) { imageDescription in
                    VStack{
                        Image(imageDescription.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        Text(imageDescription.description)
                            .font(.headline)
                            .padding()
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

struct LostItemNonImageView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemNonImageView().previewInterfaceOrientation(.landscapeLeft)
    }
}
