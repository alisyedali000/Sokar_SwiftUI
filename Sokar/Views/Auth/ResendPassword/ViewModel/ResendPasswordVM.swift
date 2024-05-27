//
//  ResendPasswordVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import Foundation

class ResendPasswordVM : ViewModel {
    
    @Published var newPassword = ""
    @Published var retypePassword = ""
    
    @Published var resetPassDone = false
    @Published var resetPassDoneAlert = ""
}
