//
//  SpecificDaysSheet.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct SpecificDaysSheet: View {
    
    private struct Config {
        
        static let title = "Specific Days"
        
        static let whenToTake = "When to take"
        
        static let buttonTitle = "Done"
    }
    
    @Environment(\.dismiss) var dismiss
    
    @State private var weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    @State private var selectedDays: [String] = []
    
    @Binding private var specificDays: [String]
    
    init(specificDays: Binding<[String]>) {
        
        self._specificDays = specificDays
    }
    
    var body: some View {
        
        loadView()
            .addBackgroundColor(color: .sheetBackground)
            .addSheetHeight(detents: [.fraction(0.3)])
    }
}

extension SpecificDaysSheet {
    
    func loadView() -> some View {
        
        VStack(spacing: 10) {
         
            topTitle
            
            daysView()
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {
                self.specificDays = selectedDays
                self.dismiss()
            }
        }
        .padding(.horizontal)
    }
}

extension SpecificDaysSheet {
    
    var topTitle: some View {
        
        Text(Config.title)
            .foregroundStyle(.white)
            .font(.medium(size: 18))
            .padding(.top)
    }
    
    func daysView() -> some View {
        
        VStack {
            
            HStack {
                Text(Config.whenToTake)
                    .foregroundStyle(.white)
                    .font(.regular(size: 16))
                    .padding(.top)
                
                Spacer()
            }
            
            HStack {
                
                ForEach(weekdays, id: \.self) { day in
                    
                    Button {
                        
                        withAnimation(.smooth(duration: 0.25)) {
                            
                            if selectedDays.contains(day) {
                                
                                // remove
                                
                                if let index = selectedDays.firstIndex(of: day) {
                                    
                                    self.selectedDays.remove(at: index)
                                }
                                
                            } else {
                                
                                // add
                                self.selectedDays.append(day)
                            }
                        }
                        
                    } label: {
                        
                        dayCircle(title: day)
                    }
                }
            }
        }
    }
    
    func dayCircle(title: String) -> some View {
        
        ZStack {
            
            Circle()
                .frame(width: 40, height: 40)
                .foregroundStyle(.white.opacity(0.1))
                .overlay {
                    
                    Circle()
                        .stroke(selectedDays.contains(title) ? Color.accentColor : .clear, lineWidth: 1.0)
                        .frame(width: 40, height: 40)
                }
            
            Text(title.prefix(2))
                .foregroundStyle(.white)
                .font(.regular(size: 15))
        }
    }
}

#Preview {
    SpecificDaysSheet(specificDays: .constant([]))
//    AddMedicationView()
}
