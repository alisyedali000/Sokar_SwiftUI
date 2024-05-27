//
//  MedicationReminderVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 15/04/2024.
//

import Foundation
import SwiftUI

class MedicationReminderVM : ViewModel {
    
    @Published var allMedicines : [MedicationModel] = medicationMockArray
    
    @Published var taken : Double = 0.0
    @Published var remaining : Double = 0.0
    
    @Published var todaysLogAnimation = false
    @Published var yourMedAnimation = false
    
    @Published var todaysLogOffset : CGFloat = 0
    @Published var yourMedOffset: CGFloat = 0
}

extension MedicationReminderVM {
    
    @MainActor func updateValues() {
        
        self.taken = 0
        self.remaining = 0
        
        withAnimation(.bouncy) {
            
            for medicine in allMedicines {
                
                if medicine.isTaken {
                    self.taken += 1
                } else {
                    self.remaining += 1
                }
            }
        }
    }
    
//    @MainActor func onChange
}
