//
//  InputLostItemView.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/21/23.
//

import SwiftUI

struct InputItemView: View {
    
    enum Tab {
        case lost
        case found
    }
    
    @State private var selectedTab: Tab = .found
    @State private var itemName: String = ""
    @State private var phoneNumber: String = ""
    @State private var date: Date = Date()
    @State private var location: String = ""
    @State private var category: String = ""
    @State private var desc: String = ""
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Text("Report Page")
                        .font(.custom("HelveticaNeue", size: 36))
                        .fontWeight(.bold)
                    Picker("", selection: $selectedTab) {
                        Text("Lost").tag(Tab.lost)
                        Text("Found").tag(Tab.found)
                    }
                    .pickerStyle(.segmented)
                    
                    if selectedTab == Tab.lost {
                        
                    } else {
                        HStack(alignment: .top) {
                            Rectangle()
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.5)
                                .cornerRadius(20)
                                .foregroundColor(Color.gray)
                                .padding(.horizontal, 70)
                            
                            
                            VStack{
                                Group {
                                    TextField("Item Name", text: $itemName)
                                    TextField("Phone Number", text: $phoneNumber)
                                    DatePicker(selection: $date, displayedComponents: .date) {
                                        //                                    Text("Date")
                                        TextField("Date", text: .constant(date.description))
                                            .disabled(true)
                                    }
                                    TextField("Location", text: $location)
                                    TextField("Category", text: $category)
                                    TextEditor(text: $desc)
                                        .border(.gray, width: 1)
                                        .frame(height: geo.size.height * 0.15)
                                }
                                .textFieldStyle(.roundedBorder)
                                //                                .border(.black)
                                .datePickerStyle(.compact)
                                .font(.custom(AppFonts.helveticaNeue, size: 20))
                                .padding(.vertical, 6)
                            }
                        }
                        .padding(.trailing, geo.size.width * 0.1)
                        .padding(.top, geo.size.height * 0.05)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Submit")
                            .font(.custom(AppFonts.robotoMedium, size: 30))
                            .foregroundColor(.white)
                    }
                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.07)
                    .background(Color(.systemGreen))
                    .cornerRadius(36)
                    .padding()
                    
                }
            }
            
        }
    }
}

struct InputLostItemView_Previews: PreviewProvider {
    static var previews: some View {
        InputItemView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
