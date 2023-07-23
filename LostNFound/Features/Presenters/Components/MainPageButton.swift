//
//  MainPageButton.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct MainPageButton: View {
    
    @State var buttonName: String = ""
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width*0.17423, height: UIScreen.main.bounds.height*0.16797)
                .foregroundColor(Color.white)
                .cornerRadius(30)
                .shadow(radius: 4, x: 8, y: 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
            Image("\(buttonName)")
                .padding()
        }
    }
}

struct MainPageButton_Previews: PreviewProvider {
    static var previews: some View {
        MainPageButton(buttonName: "found_items")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
