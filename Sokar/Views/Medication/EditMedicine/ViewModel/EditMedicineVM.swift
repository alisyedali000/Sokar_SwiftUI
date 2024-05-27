//
//  EditMedicineVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 07/05/2024.
//

import Foundation

class EditMedicineVM : ViewModel {
    
    @Published var frequency : FrequencyValues = .none
    
    @Published var specificDays : [String] = []
    @Published var daysInterval = ""
    @Published var menstrualCycle = ""
    
    @Published var notifiedTimes : [MedicineTime] = []
}

extension EditMedicineVM {
    
    @MainActor func updateValues(medicine: MedicationModel) {
        
        self.frequency = medicine.frequencyValue
        self.specificDays = medicine.specificDays
        self.daysInterval = medicine.daysIntervalValue
        self.menstrualCycle = medicine.menstrualCycle
        
        self.notifiedTimes = medicine.notifiedTime
    }
}
