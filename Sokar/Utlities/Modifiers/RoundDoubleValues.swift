//
//  RoundDoubleValues.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension String {
    
    var roundToTwo: String {
        
        if let floatValue = Float(self) {
            let formattedString = String(format: "%.2f", floatValue)
            
            return formattedString
        } else {
            debugPrint("Invalid number format")
            return ""
        }
    }
}
