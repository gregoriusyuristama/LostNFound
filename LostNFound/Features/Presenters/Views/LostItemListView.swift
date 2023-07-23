//
//  LostItemListView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/23/23.
//

import SwiftUI
import UIKit

struct LostItemListView: View {
    @State var searchText = ""
    var body: some View {
        NavigationView {
            VStack {
                NativeSearchBar(text: $searchText)
                NavigationLink(destination: LostItemView(), isActive: .constant(true)) {
                        Text("Lost item 88")
                }
                .navigationTitle("Lost Items")
                Spacer()
            }
            
        }
    }
}

struct LostItemListView_Previews: PreviewProvider {
    static var previews: some View {
        LostItemListView()
    }
}
