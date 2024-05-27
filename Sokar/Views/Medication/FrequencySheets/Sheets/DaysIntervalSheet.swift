//
//  DaysIntervalSheet.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct DaysIntervalSheet: View {
   
    private struct Config {
        
        static let title = "Days Interval"
        
        static let whenToTake = "When to take"
        
        static let buttonTitle = "Done"
    }
    
    @Environment(\.dismiss) var dismiss
    
    @State private var numbersArray = (1...30).map { String($0) }
    @State private var intervalsArray = ["Days", "Weeks", "Months"]
    
    @State private var days = ""
    @State private var intervals = ""
    
    @Binding private var daysInterval : String
    @Binding private var daysIntervalValue : String
    
    init(daysInterval: Binding<String>,
         daysIntervalValue: Binding<String>) {
        
        self._daysInterval = daysInterval
        self._daysIntervalValue = daysIntervalValue
    }
    
    var body: some View {
        
        loadView()
            .addBackgroundColor(color: .sheetBackground)
            .addSheetHeight(detents: [.fraction(0.35)])
    }
}

extension DaysIntervalSheet {
    
    func loadView() -> some View {
        
        VStack(spacing: 10) {
         
            topTitle
            
            pickers()
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {
                self.daysInterval = days
                self.daysIntervalValue = intervals
                self.dismiss()
            }
        }
        .padding(.horizontal)
    }
}

extension DaysIntervalSheet {
    
    var topTitle: some View {
        
        Text(Config.title)
            .foregroundStyle(.white)
            .font(.medium(size: 18))
            .padding(.top)
    }
    
    func pickers() -> some View {
        
        HStack {
            
            Picker("", selection: $days) {
                
                ForEach(numbersArray, id: \.self) { number in
                    Text(number)
                }
            }
            .pickerStyle(.wheel)
            
            Picker("", selection: $intervals) {
                
                ForEach(intervalsArray, id: \.self) { interval in
                    Text(interval)
                }
            }
            .pickerStyle(.wheel)
        }
        .padding(.top, -80)
    }
}

#Preview {
//    DaysIntervalSheet()
    AddMedicationView()
}
