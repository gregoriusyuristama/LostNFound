//
//  CustomDatePicker.swift
//  LostNFound
//
//  Created by Gregorius Yuristama Nugraha on 7/22/23.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var selectedDate: Date
    @State private var isDatePickerVisible = false

    var body: some View {
        VStack {
            HStack {
                Text("Date : ")
                Spacer()
                Text(dateFormatter.string(from: selectedDate))
                    .foregroundColor(.black)
                Image(systemName: self.isDatePickerVisible ? "chevron.up" : "chevron.down")
                    .foregroundColor(.black)
                    
            }
            .foregroundColor(.gray)
            .onTapGesture {
                withAnimation {
                    isDatePickerVisible.toggle()
                }
            }
            if isDatePickerVisible {
                
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
            }
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
