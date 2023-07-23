//
//  InputLostItemView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/21/23.
//

import SwiftUI

struct InputItemView: View {
    
    enum Tab {
        case lost
        case found
    }
    
    @State private var selectedTab: Tab = .found
    
    @Environment(\.presentationMode) var presentationMode
    @GestureState private var dragOffset = CGSize.zero
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .center) {
                    Text("Report Page")
                        .font(.custom("HelveticaNeue", size: 36))
                        .fontWeight(.bold)
                        .padding(.top)
                    Picker("", selection: $selectedTab) {
                        Text("Lost").tag(Tab.lost)
                        Text("Found").tag(Tab.found)
                    }
                    .pickerStyle(.segmented)
                    
                    if selectedTab == Tab.lost {
                        ReportLostPage(geo: geo)
                    } else {
                        ReportFoundPage(geo: geo)
                    }
                    
                }
                .toolbarBackground(AppColor.blueNavigationBar, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
            .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            presentationMode.wrappedValue.dismiss()
            
        }, label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
                Text("Back")
                    .foregroundColor(.white)
                //                                .font(UIHelper.largeSize())
            }
        })
        )
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
             if(value.startLocation.x < 20 &&
                        value.translation.width > 100) {
                 self.presentationMode.wrappedValue.dismiss()
             }
        }))
    }
}

struct InputLostItemView_Previews: PreviewProvider {
    static var previews: some View {
        InputItemView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


