//
//  GraphEnums.swift
//  Sokar
//
//  Created by Taimoor Arif on 01/05/2024.
//

import Foundation

enum GraphType {
    
    case hour
    case day
    case week
    case month
    case sixMonth
    case year
}

extension GraphType {
    
    var title: String {
        
        switch self {
            
        case .hour:
            
            return "H"
            
        case .day:
            
            return "D"
            
        case .week:
            
            return "W"
            
        case .month:
            
            return "M"
            
        case .sixMonth:
            
            return "6M"
            
        case .year:
            
            return "Y"
        }
    }
    
    var dateComponent: Calendar.Component {
        
        switch self {
            
        case .hour:
            
            return .minute
            
        case .day:
            
            return .hour
            
        case .week:
            
            return .day
            
        case .month:
            
            return .weekday
            
        case .sixMonth:
            
            return .month
            
        case .year:
            
            return .month
        }
    }
    
    var array: [GlucoseModel] {
        
        switch self {
            
        case .hour:
            
            return glucoseHourMockArray
            
        case .day:
            
            return glucoseDayMockArray
            
        case .week:
            
            return glucoseWeekMockArray
            
        case .month:
            
            return glucoseMonthMockArray
            
        case .sixMonth:
            
            return glucoseSixMonthMockArray
            
        case .year:
            
            return glucoseYearMockArray
        }
    }
}
