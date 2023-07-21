//
//  ShowFoundItemsView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/20/23.
//

import SwiftUI

struct ShowFoundItemsView: View {
    @StateObject var vm = InputFoundItemViewModel()
    var body: some View {
        
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button {
                vm.fetchFoundItems()
            } label: {
                Text("Refresh")
            }
            ZStack {
                ProgressView()
                    .opacity(vm.isLoading ? 1 : 0)
                
                List{
                    ForEach(vm.allItems) { data in
                        VStack {
                            Text(data.desc!)
                                AsyncImage(url: data.imageURL) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 200, maxHeight: 200)
                                } placeholder: {
                                    ProgressView()
                                }

                        }
                    }
                }
                .opacity(vm.isLoading ? 0 : 1)
            }
        }
        .onAppear{
            vm.fetchFoundItems()
        }
    }
}

struct ShowFoundItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowFoundItemsView()
    }
}
