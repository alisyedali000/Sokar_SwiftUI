//
//  InsulinHistoryVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 10/05/2024.
//

import Foundation

class InsulinHistoryVM : ViewModel {
    
    @Published var selectedDate = Date()
    @Published var insulinArray : [InsulinModel] = insulinMockArray
}

extension InsulinHistoryVM {
    
    func getTotalInsulinUnits() -> Int {
    
        var totalUnits: Int = 0
        
        for insulin in insulinArray {
            
            let unit = insulin.units
            
            totalUnits += unit
        }
        
        return totalUnits
    }
}
