//
//  ItemImage.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

import SwiftUI

struct ItemImage: View {
    @State var imageURL: URL?
    var body: some View {
        Rectangle()
            .fill(.clear)
            .frame(width: UIScreen.main.bounds.width*0.23, height: UIScreen.main.bounds.height*0.311)
            .overlay {
                AsyncImage(url: imageURL) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width*0.23, height: UIScreen.main.bounds.height*0.311)
                } placeholder: {
                    ProgressView()
                }
            }
        

//        Image(imageName)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .frame(width: UIScreen.main.bounds.width*0.23, height: UIScreen.main.bounds.height*0.311)
//            .overlay(
//                RoundedRectangle(cornerRadius: 30)
//                    .stroke(Color.black, lineWidth: 1)
//            )
    }
}

//struct ItemImage_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemImage(imageURL: .constant(URL(string: ""))).previewInterfaceOrientation(.landscapeLeft)
//    }
//}
