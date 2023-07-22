//
//  CapsuleButton.swift
//  LostNFound
//
//  Created by Dhil Khairan Badjiser on 21/07/23.
//

import SwiftUI

struct CapsuleButton: View {
    
    @State var text = "Label"
    
    var body: some View {
        
        Text(text)
            .frame(width: UIScreen.main.bounds.width*0.219, height: UIScreen.main.bounds.height*0.071)
            .font(.system(size: 30))
            .bold()
            .foregroundColor(.white)
            .background(Color("GreenLogin"))
            .cornerRadius(36)
            .shadow(radius: 4, x: 8, y: 8)
    }
}



struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(text: "Label")
            .previewLayout(.sizeThatFits)
    }
}
