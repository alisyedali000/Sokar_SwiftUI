//
//  ForgetPasswordVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import Foundation

class ForgetPasswordVM : ViewModel {
    
    @Published var email = ""
    @Published var otp = ""
    
    @Published var isCodeSent = false
    @Published var userID = 0
    
    @Published var moveToChangePassword = false
}
