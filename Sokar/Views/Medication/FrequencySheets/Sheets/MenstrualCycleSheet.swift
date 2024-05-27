//
//  MenstrualCycleSheet.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct MenstrualCycleSheet: View {
    
    private struct Config {
        
        static let title = "Days Interval"
        
        static let whenToTake = "When to take"
        
        static let buttonTitle = "Done"
    }
    
    @Environment(\.dismiss) var dismiss
    
    @State private var cyclesArray = ["21 Take, 7 Break", "22 Take, 6 Break", "23 Take, 5 Break", "24 Take, 4 Break", "25 Take, 3 Break", "26 Take, 2 Break", "27 Take, 1 Break", "28 Take, 0 Break"]
    
    @State private var selectedCycle = ""
    
    @Binding private var menstrualCycle : String
    
    init(menstrualCycle: Binding<String>) {
        
        self._menstrualCycle = menstrualCycle
    }
    
    var body: some View {
        
        loadView()
            .addBackgroundColor(color: .sheetBackground)
            .addSheetHeight(detents: [.fraction(0.4)])
    }
}

extension MenstrualCycleSheet {
    
    func loadView() -> some View {
        
        VStack {
         
            topTitle
            
            pickers()
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {
                self.menstrualCycle = selectedCycle
                self.dismiss()
            }
        }
        .padding(.horizontal)
    }
}

extension MenstrualCycleSheet {
    
    var topTitle: some View {
        
        Text(Config.title)
            .foregroundStyle(.white)
            .font(.medium(size: 18))
            .padding(.top)
    }
    
    func pickers() -> some View {
        
        HStack {
            
            Picker("", selection: $selectedCycle) {
                
                ForEach(cyclesArray, id: \.self) { cycle in
                    Text(cycle)
                }
            }
            .pickerStyle(.wheel)
        }
    }
}

#Preview {
//    MenstrualCycleSheet(menstrualCycle: .constant(""))
    AddMedicationView()
}
