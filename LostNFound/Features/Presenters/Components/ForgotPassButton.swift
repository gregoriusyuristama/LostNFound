//
//  ForgotPassButton.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct ForgotPassButton: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width*0.1618, height: UIScreen.main.bounds.height*0.0242)
                .foregroundColor(Color.white)
            
            Text("Forgot Password")
                .foregroundColor(Color("BlueLogin"))
                .fontWeight(.bold)
        }
    }
}

struct ForgotPassButton_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassButton()
            .previewInterfaceOrientation(.landscapeLeft)
    }
    
}
