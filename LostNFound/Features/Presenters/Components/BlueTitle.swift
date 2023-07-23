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
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(Color("BlueTitle"))
                Text(title)
                    .padding(17)
//                    .frame(width: geo.size.width, height: geo.size.height*0.1)
                    .font(.custom(AppFonts.helveticaNeue, size: 30))
                    .bold()
                    .foregroundColor(.white)
//                    .background()
//                Spacer()
            }
            
        }
       

    }
}

struct BlueTitle_Previews: PreviewProvider {
    static var previews: some View {
        BlueTitle().previewInterfaceOrientation(.landscapeLeft)
    }
}
