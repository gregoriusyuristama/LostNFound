//
//  LostItemListView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/23/23.
//

import SwiftUI

struct LostItemListView: View {
    @StateObject var vm = InputLostItemViewModel()
    @State var searchText = ""
    var body: some View {
        ZStack {
            ProgressView()
                .opacity(vm.isLoading ? 1 : 0)
            NavigationSplitView {
                VStack {
                    HStack {
                        Text("Lost Item")
                            .font(.system(size: 34))
                            .bold()
                        Spacer()
                    }
                    .padding(.leading, 16)
                    NativeSearchBar(text: $searchText)
                    ForEach(vm.allItems) { item in
                        NavigationLink("Test", destination: LostItemView(), isActive: .constant(true))
                        HStack {
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 99, height: 95)
                                .overlay {
                                    AsyncImage(url: item.imageURL) { image in
                                        image.resizable()
                                            .scaledToFit()
                                            .frame(width: 99, height: 95)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                .padding(.leading, 20)
                            
                            VStack(alignment: .leading) {
                                if let id = item.id {
                                    let uuidString = id.uuidString
                                    let start = uuidString.index(uuidString.endIndex, offsetBy: -3)
                                    let end = uuidString.index(uuidString.endIndex, offsetBy: 0)
                                    let range = start..<end
                                    let newId = uuidString[range]
                                    Text("Lost #\(newId.description)")
                                        .font(.custom(AppFonts.helveticaNeue, size: 24))
                                        .fontWeight(.medium)
                                }
                                Divider()
                                HStack {
                                    Text("\(item.itemName ?? "")")
                                        .font(.custom(AppFonts.helveticaNeue, size: 15))
                                    Spacer()
                                    Text("\(item.dateFound!.shortDate())")
                                        .font(.custom(AppFonts.helveticaNeue, size: 14))
                                }
                                HStack {
                                    Text("PROCESS")
                                        .font(.custom(AppFonts.helveticaNeue, size: 14))
                                        .frame(width: 100,height: 20)
                                        .border(.black)
                                    Text("\(item.currentLocation!.uppercased())")
                                        .font(.custom(AppFonts.helveticaNeue, size: 14))
                                        .fontWeight(.medium)
                                        .frame(width: 100,height: 20)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .toolbar(.hidden, for: .navigationBar)
            } detail: {
                LostItemView()
            }
            .opacity(vm.isLoading ? 0 : 1)
        }
        .onAppear{
            vm.fetchFoundItems()
        }
        
        
    }
}

struct LostItemListView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemListView()
    }
}
