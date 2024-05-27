//
//  MedicationByDateVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import Foundation
import SwiftUI

class MedicationByDateVM : ViewModel {
    
    @Published var selectedDate = Date()
    @Published var allMedicines : [MedicationModel] = medicationMockArray
    
    @Published var taken : Double = 0.0
    @Published var remaining : Double = 0.0
}

extension MedicationByDateVM {
    
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
}
