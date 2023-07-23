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
    @State var selectedItem: ItemLost?
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
                        Button {
                            selectedItem = item
                        } label: {
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
                                            .foregroundColor(selectedItem?.id == item.id ? Color.white : Color.black)
                                    }
                                    Divider()
                                    HStack {
                                        Text("\(item.itemName ?? "")")
                                            .font(.custom(AppFonts.helveticaNeue, size: 15))
                                            .foregroundColor(selectedItem?.id == item.id ? Color.white : Color.black)
                                        Spacer()
                                        Text("\(item.dateFound!.shortDate())")
                                            .font(.custom(AppFonts.helveticaNeue, size: 14))
                                            .foregroundColor(selectedItem?.id == item.id ? Color.white : Color.black)
                                    }
                                    HStack {
                                        Text("PROCESS")
                                            .font(.custom(AppFonts.helveticaNeue, size: 12))
                                            .frame(width: 75,height: 20)
                                            .border(.black)
                                            .background(Color.white)
                                            .foregroundColor(.black)
                                        Text("\(Constants.allStationNames[item.currentLocation!]!.uppercased())")
                                            .font(.custom(AppFonts.helveticaNeue, size: 12))
                                            .fontWeight(.medium)
                                            .frame(width: 75,height: 20)
                                            .background(Color.green)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .padding(21)
                            .background(
                                withAnimation{
                                    selectedItem?.id == item.id ? Color.blue : Color.clear
                                }
                            )
                        }
                    }
                    .background(Color.white)
                    Spacer()
                }
                .toolbar(.hidden, for: .navigationBar)
            } detail: {
                if let _ = selectedItem {
                    LostItemView(item: $selectedItem)
                }else {
                    Text("Please select an item")
                }
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
