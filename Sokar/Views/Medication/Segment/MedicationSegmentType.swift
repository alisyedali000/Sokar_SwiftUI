//
//  MedicationSegmentType.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import Foundation

enum MedicationSegmentType {
    
    case todaysLog
    case yourMedication
}

extension MedicationSegmentType {
    
    var title: String {
        
        switch self {
            
        case .todaysLog:
            
            return "Today's Log"
            
        case .yourMedication:
            
            return "Your Medication"
        }
    }
}
