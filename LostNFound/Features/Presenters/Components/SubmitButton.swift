//
//  SubmitButton.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/22/23.
//

import SwiftUI

struct SubmitButton: View {
    var doSubmit: () -> ()
    var body: some View {
        Button {
            doSubmit()
        } label: {
            Text("Submit")
                .font(.custom(AppFonts.robotoMedium, size: 30))
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.07)
                .background(Color(.systemGreen))
                .cornerRadius(36)
                .padding(.top, UIScreen.main.bounds.height * 0.08)
                .shadow(radius: 4, y: 4)
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(doSubmit: {})
    }
}
