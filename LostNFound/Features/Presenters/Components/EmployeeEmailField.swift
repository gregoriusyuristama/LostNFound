//
//  EmployeeEmailField.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct EmployeeEmailField: View {
    
    @State var email: String = ""
    
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
                Image(systemName: "person")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*0.02714, height: UIScreen.main.bounds.height*0.0391)
                    .padding(EdgeInsets(top: 0, leading: 41, bottom: 0, trailing: 0))
                
                TextField("Employee E-Mail", text: $email)
                    .textFieldStyle(.plain)
                    .font(.system(size: 32))
                    .fontWeight(.light)
                            .padding()
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.388, height: UIScreen.main.bounds.height*0.115)
    }
}

struct EmployeeEmailField_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeEmailField()
    }
}
