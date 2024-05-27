//
//  MedicationModel.swift
//  Sokar
//
//  Created by Taimoor Arif on 05/04/2024.
//

import Foundation

struct MedicationModel: Identifiable, Equatable {
    
    var id = UUID().uuidString
    var name: String
    var isTaken: Bool
    var frequency: String
    var specificDays: [String]
    var daysInterval: String
    var daysIntervalValue: String
    var menstrualCycle: String
    var startDate: String
    var notifiedTime: [MedicineTime]
    
    var offset: CGFloat? // last two params are for swipe to delete
    var isSwiped: Bool?
    
    var medCellValue: String {
        
        switch frequencyValue {
            
        case .daily:
            
            return "Daily"
            
        case .specificDays:
            
            let allDays = specificDays.map { $0.prefix(3) }
            let days = allDays.joined(separator: " | ")
            
            return days
            
        case .daysInterval:
            
            let intervals = "\(daysIntervalValue) \(daysInterval)"
            
            return intervals
            
        case .menstrualCycle:
            
            return menstrualCycle
            
        case .none:
            
            return ""
        }
    }
    
    var frequencyValue: FrequencyValues {
        
        if frequency == "Daily" {
            return .daily
        }
        
        if frequency == "Specific Days" {
            return .specificDays
        }
        
        if frequency == "Days Interval" {
            return .daysInterval
        }
        
        if frequency == "Menstrual Cycle" {
            return .menstrualCycle
        }
        
        return .none
    }
}

extension MedicationModel {
    
    static func == (lhs: MedicationModel, rhs: MedicationModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct MedicineTime: Identifiable, Equatable {
    
    var id = UUID().uuidString
    var time: String
    var quantity: Int
}

let medicationMock = MedicationModel(name: "Probiotics, 250 mg", isTaken: false, frequency: "Daily", specificDays: [], daysInterval: "", daysIntervalValue: "", menstrualCycle: "", startDate: "2024-04-15 15:02:06", notifiedTime: [MedicineTime(time: "09:00 am", quantity: 1), MedicineTime(time: "03:00 pm", quantity: 2), MedicineTime(time: "09:00 pm", quantity: 1)])

let medicationMockArray = [
    
    MedicationModel(name: "Probiotics, 250 mg", isTaken: false, frequency: "Daily", specificDays: [], daysInterval: "", daysIntervalValue: "", menstrualCycle: "", startDate: "2024-04-15 15:02:06", notifiedTime: [MedicineTime(time: "09:00 am", quantity: 1), MedicineTime(time: "03:00 pm", quantity: 2), MedicineTime(time: "09:00 pm", quantity: 1)]),
    
    MedicationModel(name: "Paracetamol, 250 mg", isTaken: true, frequency: "Specific Days", specificDays: ["Monday", "Tuesday", "Thursday"], daysInterval: "", daysIntervalValue: "", menstrualCycle: "", startDate: "2024-04-15 15:02:06", notifiedTime: [MedicineTime(time: "09:00 am", quantity: 1), MedicineTime(time: "03:00 pm", quantity: 2), MedicineTime(time: "09:00 pm", quantity: 1)]),
    
    MedicationModel(name: "Azomax, 250 mg", isTaken: true, frequency: "Days Interval", specificDays: [], daysInterval: "Days", daysIntervalValue: "5", menstrualCycle: "", startDate: "2024-04-15 15:02:06", notifiedTime: [MedicineTime(time: "09:00 am", quantity: 1), MedicineTime(time: "03:00 pm", quantity: 2), MedicineTime(time: "09:00 pm", quantity: 1)]),
    
    MedicationModel(name: "Softin, 20 mg", isTaken: false, frequency: "Menstrual Cycle", specificDays: [], daysInterval: "", daysIntervalValue: "", menstrualCycle: "24 Take, 4 Break", startDate: "2024-04-15 15:02:06", notifiedTime: [MedicineTime(time: "09:00 am", quantity: 1), MedicineTime(time: "03:00 pm", quantity: 2), MedicineTime(time: "09:00 pm", quantity: 1)]),
]
