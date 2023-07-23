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
            .frame(width: UIScreen.main.bounds.width*0.15, height: UIScreen.main.bounds.height*0.03)
            .font(.custom(AppFonts.helveticaNeue, size: 14))
            .fontWeight(.medium)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.trailing, 60)
    }
}

struct ProcessButton_Previews: PreviewProvider {
    static var previews: some View {
        ProcessButton().previewInterfaceOrientation(.landscapeLeft)
    }
}
