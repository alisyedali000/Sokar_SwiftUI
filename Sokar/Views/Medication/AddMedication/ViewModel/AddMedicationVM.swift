//
//  AddMedicationVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import Foundation

class AddMedicationVM : ViewModel {
    
    @Published var medicineName = ""
    @Published var frequency : FrequencyValues = .none
    
    @Published var specificDays : [String] = []
    
    @Published var daysInterval = ""
    
    @Published var menstrualCycle = ""
    
    @Published var startDate = Date()
    
    @Published var selectedDate = Date()
    @Published var notifiedTimes: [MedicineTime] = []
}
