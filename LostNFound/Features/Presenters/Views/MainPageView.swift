//
//  MainPageView.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0){
                
                //Top Bar
                ZStack {
                    Rectangle()
                        .foregroundColor(AppColor.blueNavigationBar)
                    
                    //MRT Logo
                    HStack{
                        Image("mrt_logo_2")
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 0, leading: 34, bottom: 0, trailing: 0))
                }
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.1064)
                
                //Image
                Image("mrt_main_page")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.3331)
                
                //Buttons
                HStack(spacing: 105){
                    
                    //Add Report Button
                    NavigationLink {
                        InputItemView()
                    } label: {
                        MainPageButton(buttonName: "add_report")
                    }
                    
                    
                    //Lost Report Button
                    Button{
                        
                    }label: {
                        MainPageButton(buttonName: "lost_report")
                    }
                    
                    //Found Items Button
                    Button{
                        
                    }label: {
                        MainPageButton(buttonName: "found_items")
                    }
                }
                .padding(EdgeInsets(top: 101, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()
                
                //Help Button
                HStack{
                    Button{
                        
                    }label: {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width*0.0374, height: UIScreen.main.bounds.height*0.0488)
                    }
                    .padding(EdgeInsets(top: 104, leading: 1268, bottom: 33, trailing: 48))
                    
                }
                
                
            }
        }
        .tint(.white)
        
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
