//
//  ProcessButton.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

import SwiftUI

struct ProcessButton: View {
    var body: some View {
        Text("PROCESS")
            .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.061)
            .font(.system(size: 25))
            .bold()
            .border(Color.black)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 2)
            )
    }
}

struct ProcessButton_Previews: PreviewProvider {
    static var previews: some View {
        ProcessButton().previewInterfaceOrientation(.landscapeLeft)
    }
}
