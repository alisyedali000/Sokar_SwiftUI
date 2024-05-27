//
//  TimePickerSheet.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct TimePickerSheet: View {
    
    private struct Config {
        
        static let title = "Select Time"
        
        static let buttonTitle = "Done"
    }
    
    @State private var date = Date()
    
    private var doneTapped: (Date) -> Void
    
    init(doneTapped: @escaping (Date) -> Void) {
        
        self.doneTapped = doneTapped
    }
    
    var body: some View {
        
        loadView()
            .addBackgroundColor(color: .sheetBackground)
            .addSheetHeight(detents: [.fraction(0.4)])
    }
}

extension TimePickerSheet {
    
    func loadView() -> some View {
        
        VStack {
         
            topTitle
            
            timePicker()
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {

                self.doneTapped(date)
            }
        }
        .padding(.horizontal)
    }
}

extension TimePickerSheet {
    
    var topTitle: some View {
        
        Text(Config.title)
            .foregroundStyle(.white)
            .font(.medium(size: 18))
            .padding(.top)
    }
    
    func timePicker() -> some View {
        
        HStack {
            
            DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                .preferredColorScheme(.dark)
                .datePickerStyle(.wheel)
                .tint(.accent)
        }
    }
}

#Preview {
    TimePickerSheet(doneTapped: { _ in})
}
