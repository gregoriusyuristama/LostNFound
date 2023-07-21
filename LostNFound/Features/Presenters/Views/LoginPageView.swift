//
//  LoginPageView.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct LoginPageView: View {
    
    var body: some View {
        
        VStack{
         
            //MRT Logo
            Image("mrt_logo")
                .resizable()
                .frame(width: UIScreen.main.bounds.width*0.347, height: UIScreen.main.bounds.height*0.234)
                .padding(EdgeInsets(top: 65, leading: 0, bottom: 89, trailing: 0))
            
            //Employee ID Field
            DropdownSelector(placeholder: "Employee ID", options: Constants.options)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: UIScreen.main.bounds.height*0.0479, trailing: 0))
                .zIndex(2)
            
            //Password Field
            PasswordField()
            
            
            //Forgot Password Buttom
            HStack {
                Button{
                    
                }label: {
                    ForgotPassButton()
                }
                    .padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width*0.5359, bottom: 0, trailing: 0))
                Spacer()
            }
            
            //Login Button
            Button{
                
            }label: {
                CapsuleButton(text: "Login")
            }
            .padding(EdgeInsets(top: 85, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
        }
        
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
