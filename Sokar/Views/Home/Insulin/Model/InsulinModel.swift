//
//  InsulinModel.swift
//  Sokar
//
//  Created by Taimoor Arif on 08/05/2024.
//

import Foundation

struct InsulinModel : Identifiable {
    
    var id = UUID().uuidString
    
    var units: Int
    var time: String
    var glucoseLevel: String
    
    var dateToDisplay: String {
        
        return time.toDateString("yyyy-MM-dd HH:mm:ss", returnFormat: "hh:mm a")
    }
}

let insulinMock = InsulinModel(units: 4, time: "2024-05-04 14:02:56", glucoseLevel: "148")

let insulinMockArray = [

    InsulinModel(units: 4, time: "2024-05-04 08:14:02", glucoseLevel: "122"),
    InsulinModel(units: 2, time: "2024-05-05 10:15:59", glucoseLevel: "153"),
    InsulinModel(units: 1, time: "2024-05-07 16:48:31", glucoseLevel: "154"),
    InsulinModel(units: 2, time: "2024-05-08 21:22:15", glucoseLevel: "155"),
]
