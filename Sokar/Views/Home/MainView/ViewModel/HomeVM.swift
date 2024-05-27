//
//  HomeVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 08/05/2024.
//

import Foundation

class HomeVM : ViewModel {
    
    @Published var user = userMock
    @Published var glucoseData = glucoseSingleDayMockArray
    @Published var hearRate : Int = 116
    
    @Published var insulinArray = insulinMockArray
}

extension HomeVM {
    
    func getTotalInsulinUnits() -> Int {
        return insulinArray.reduce(0) { $0 + $1.units }
    }
}
