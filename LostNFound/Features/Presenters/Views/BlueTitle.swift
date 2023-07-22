//
//  BlueTitle.swift
//  LostNFound
//
//  Created by Tiffany Angela Indryani on 22/07/23.
//

import SwiftUI

struct BlueTitle: View {
    @State var title = "Lost#88"

    var body: some View {
        Text(title)
            .padding(50)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.15, alignment: .leading)
            .font(.system(size: 50))
            .bold()
            .foregroundColor(.white)
            .background(Color("BlueTitle"))

    }
}

struct BlueTitle_Previews: PreviewProvider {
    static var previews: some View {
        BlueTitle().previewInterfaceOrientation(.landscapeLeft)
    }
}
