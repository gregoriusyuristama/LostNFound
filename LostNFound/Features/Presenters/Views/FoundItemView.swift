//
//  FoundItemView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/23/23.
//

import SwiftUI

struct FoundItemView: View {
    
    @Binding var item: ItemFound?
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(.clear)
                .frame(width: UIScreen.main.bounds.width*0.366, height: UIScreen.main.bounds.height*0.488)
                .overlay {
                    AsyncImage(url: item?.imageURL) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width*0.366, height: UIScreen.main.bounds.height*0.488)
                    } placeholder: {
                        ProgressView()
                    }
                }
                .padding(48)
            HStack {
                ProcessButton()
                Text("\(Constants.allStationNames[(item?.currentLocation!)!]!.uppercased())")
                    .frame(width: UIScreen.main.bounds.width*0.15, height: UIScreen.main.bounds.height*0.03)
                    .font(.custom(AppFonts.helveticaNeue, size: 14))
                    .fontWeight(.medium)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.clear, lineWidth: 1)
                    )
                    .padding(.trailing, 60)
            }
            VStack{
                HStack {
                    Text("Item Name")
                        .bold()
                    Text("\(item?.itemName ?? "")")
                }
                HStack {
                    Text("Description")
                        .bold()
                    Text("\(item?.desc ?? "")")
                }
                
                HStack {
                    Text("Lost Date")
                        .bold()
                    Text("\(item?.dateFound?.shortDate() ?? "")")
                }
            }
            .font(.custom(AppFonts.helveticaNeue, size: 18))
            .frame(width: UIScreen.main.bounds.width * 0.382, height: UIScreen.main.bounds.height * 0.157)
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
                    Text("Found #\(newId.description)")
                        .foregroundColor(.white)
                        .font(.custom(AppFonts.helveticaNeue, size: 50))
                        .bold()
                        .padding(.bottom, 28)
                }
                
            }
        })
        .toolbarBackground(AppColor.blueNavigationBar, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        var gridItems: [GridItem] {
            Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
        }
    }
}

//struct FoundItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoundItemView()
//    }
//}
