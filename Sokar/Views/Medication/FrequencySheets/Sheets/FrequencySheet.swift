//
//  FrequencySheet.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct FrequencySheet: View {
    
    private struct Config {
        
        static let title = "Frequency"
    }
    
    @Binding private var frequency: FrequencyValues
    private var action: () -> Void
    
    init(frequency: Binding<FrequencyValues>,
         action: @escaping () -> Void) {
        
        self._frequency = frequency
        self.action = action
    }
    
    var body: some View {
        
        loadView()
            .addBackgroundColor(color: Color(hex: "#222D30"))
            .addSheetHeight(detents: [.fraction(0.35)])
    }
}

extension FrequencySheet {
    
    func loadView() -> some View {
        
        VStack(spacing: 20) {
            
            topTitle
            
            allFrequencies
            
            Spacer()
        }
    }
}

extension FrequencySheet {
    
    var topTitle: some View {
        
        Text(Config.title)
            .foregroundStyle(.white)
            .font(.medium(size: 18))
            .padding(.top)     
    }
    
    var allFrequencies: some View {
        
        VStack {
            
            frequencyValue(frequency: .daily)
            
            rectangle
            
            frequencyValue(frequency: .specificDays)
            
            rectangle
            
            frequencyValue(frequency: .daysInterval)
            
            rectangle
            
            frequencyValue(frequency: .menstrualCycle)
        }
    }
    
    var rectangle: some View {
        
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(.white.opacity(0.1))
    }
}

extension FrequencySheet {
    
    func frequencyValue(frequency: FrequencyValues) -> some View {
        
        Button {
            
            self.frequency = frequency
            self.action()
            
        } label: {
            
            HStack {
                
                Text(frequency.title)
                    .font(.regular(size: 16))
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 5)
        }
    }
}

#Preview {
//    FrequencySheet(frequency: .constant(.daily), action: {})
    AddMedicationView()
}
