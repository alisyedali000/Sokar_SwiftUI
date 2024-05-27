//
//  UserDetailVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 30/04/2024.
//

import Foundation

class UserDetailVM : ViewModel {
    
    @Published var glucoseData = glucoseSingleDayMockArray
    @Published var heartRate : Int = 116
}
