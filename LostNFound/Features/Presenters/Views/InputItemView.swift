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

    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Text("Report Page")
                        .font(.custom("HelveticaNeue", size: 36))
                        .fontWeight(.bold)
                    Picker("", selection: $selectedTab) {
                        Text("Lost").tag(Tab.lost)
                        Text("Found").tag(Tab.found)
                    }
                    .pickerStyle(.segmented)
                    
                    if selectedTab == Tab.lost {
                        
                    } else {
                        ReportFoundPage(geo: geo)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Submit")
                            .font(.custom(AppFonts.robotoMedium, size: 30))
                            .foregroundColor(.white)
                    }
                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.07)
                    .background(Color(.systemGreen))
                    .cornerRadius(36)
                    .padding()
                    
                }
            }
            
        }
    }
}

struct InputLostItemView_Previews: PreviewProvider {
    static var previews: some View {
        InputItemView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


