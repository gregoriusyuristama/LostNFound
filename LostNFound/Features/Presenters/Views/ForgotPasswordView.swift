//
//  ForgotPasswordView.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    var body: some View {
        
        VStack{
         
            //MRT Logo
            Image("mrt_logo")
                .resizable()
                .frame(width: UIScreen.main.bounds.width*0.347, height: UIScreen.main.bounds.height*0.234)
                .padding(EdgeInsets(top: 65, leading: 0, bottom: 170, trailing: 0))
            
            //Password Field
            PasswordField()
            
            
            //Login Button
            Button{
                
            }label: {
                CapsuleButton(text: "Submit")
            }
            .padding(EdgeInsets(top: 166, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
        }
        
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
