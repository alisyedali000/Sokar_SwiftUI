//
//  AddFrequenyVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import Foundation

class AddFrequenyVM : ViewModel {
    
    @Published var selectedDays: [String] = [] // for specific days
    @Published var days = "" // for days interval
    @Published var selectedCycle = "" // for menstrual cycle
}

extension AddFrequenyVM {
    
    @MainActor func updateValues(from selection: FrequencyValues) {
        
        switch selection {
            
        case .daily:
            
            self.selectedDays.removeAll()
            self.days = ""
            self.selectedCycle = ""
            
        case .specificDays:
            
            self.days = ""
            self.selectedCycle = ""
            
        case .daysInterval:
            
            self.selectedDays.removeAll()
            self.selectedCycle = ""
            
        case .menstrualCycle:
            
            self.selectedDays.removeAll()
            self.days = ""
            
        case .none:
            
            self.selectedDays.removeAll()
            self.days = ""
            self.selectedCycle = ""
        }
    }
}
