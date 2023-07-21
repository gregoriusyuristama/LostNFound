//
//  ContentView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink {
//                    InputFoundItemView()
//                } label: {
//                    Text("Input Item")
//                }
//
//                NavigationLink {
//                    ShowFoundItemsView()
//                } label: {
//                    Text("Show All Items")
//                }
//            }
//            .padding()
//        }
        InputItemView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
