//
//  GlucoseHistoryVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 01/05/2024.
//

import Foundation

class GlucoseHistoryVM : ViewModel {
    
    @Published var selectedType: GraphType = .hour
}

extension GlucoseHistoryVM {
    
    @MainActor func calculateValues() -> (Int, Int, Int) { // first for average, 2nd for lowest, third for highest
        
        var allValues : [Int] = []
        
        for entry in selectedType.array {
            
            let value = entry.value
            allValues.append(value)
        }
        
        let sum = allValues.reduce(0, +)
        
        let average = sum / selectedType.array.count
        
        guard let minValue = allValues.min() else { return (average, 0, 0) }
        guard let maxValue = allValues.max() else { return (average, minValue, 0) }
        
        return (average, minValue, maxValue)
    }
}
