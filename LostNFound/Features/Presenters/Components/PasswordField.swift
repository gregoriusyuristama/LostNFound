//
//  PasswordField.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct PasswordField: View {
    
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(Color.white)
                .border(Color.black)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )

            
            HStack{
                Image(systemName: "lock")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*0.0198, height: UIScreen.main.bounds.height*0.0381)
                    .padding(EdgeInsets(top: 0, leading: 41, bottom: 0, trailing: 0))
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.plain)
                    .font(.system(size: 32))
                    .fontWeight(.light)
                            .padding()
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.388, height: UIScreen.main.bounds.height*0.115)
    }
}

struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField()
    }
}
