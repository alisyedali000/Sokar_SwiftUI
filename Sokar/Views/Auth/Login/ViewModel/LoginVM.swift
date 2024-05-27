//
//  LoginVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import Foundation

class LoginVM: ViewModel {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var moveToForgotPassword = false
}
