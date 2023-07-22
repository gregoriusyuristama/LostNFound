//
//  ReportFoundPage.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/21/23.
//

import SwiftUI

struct ReportFoundPage: View {
    let geo: GeometryProxy
    @State private var itemName: String = ""
    @State private var phoneNumber: String = ""
    @State private var date: Date = Date()
//    @State private var location: DropdownOption?
    @State private var location: String?
    @State private var category: String = "Non-Valueable"
    @State private var subCategory: String = ""
    @State private var desc: String = ""
    @FocusState private var isTextEditorFocused: Bool
    
    
    
    var body: some View {
        HStack(alignment: .top) {
            Button {
                
            } label: {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.5)
                    .cornerRadius(20)
                    .foregroundColor(AppColor.grayEmptyImage)
                    .padding(.horizontal, 70)
            }
            
            
            VStack{
                Group {
                    TextField("Item Name", text: $itemName)
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.numberPad)
                    CustomDatePicker(selectedDate: $date)
                    CustomDropdownMenu(selectedOption: $location, options: Constants.allStationNames, placeholder: "Location")
                    HStack {
                        Text("Category")
                            .foregroundColor(.gray)
                        Spacer()
                        Picker("", selection: $category) {
                            ForEach(ItemCategory.category.keys.sorted(), id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        Picker("", selection: $subCategory) {
                            if let value = ItemCategory.category[category] {
                                ForEach(value, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    TextEditor(text: $desc)
                        .frame(height: geo.size.height * 0.1)
                        .overlay {
                            if desc == "" && !isTextEditorFocused{
                                HStack {
                                    VStack {
                                        Text("Item Description")
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                
                            }
                        }
                        .focused($isTextEditorFocused)
                }
                .textFieldStyle(.plain)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.black, lineWidth: 1)
                })
                .datePickerStyle(.compact)
                .font(.custom(AppFonts.helveticaNeue, size: 20))
                .padding(.bottom, 10)
            }
        }
        .tint(.blue)
        .padding(.trailing, geo.size.width * 0.1)
        .padding(.top, geo.size.height * 0.05)
    }
}

struct ReportFoundPage_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ReportFoundPage(geo: geo)
        }
    }
}
