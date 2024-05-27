//
//  FrequencyEnums.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import Foundation

enum FrequencyValues {
 
    case daily
    case specificDays
    case daysInterval
    case menstrualCycle
    case none
}

extension FrequencyValues {
    
    var title: String {
        
        switch self {
            
        case .daily:
            
            return "Daily"
            
        case .specificDays:
            
            return "Specific Days"
            
        case .daysInterval:
            
            return "Days Interval"
            
        case .menstrualCycle:
            
            return "Menstrual Cycle"
            
        case .none:
            
            return "Remind Me"
        }
    }
}
