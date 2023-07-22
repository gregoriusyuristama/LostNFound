//
//  DropDownMenu.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/22/23.
//

import SwiftUI


struct CustomDropdownMenu: View {
    @Binding var selectedOption: String?
    let options: [String]
    let placeholder: String
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                }) {
                    Text(option)
                }
            }
        } label: {
            HStack {
                Text(selectedOption ?? placeholder)
                    .foregroundColor(selectedOption != nil ? .black : .gray)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.black)
            }
        }
    }
}
