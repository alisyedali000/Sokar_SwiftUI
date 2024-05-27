//
//  ChangePasswordVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import Foundation

class ChangePasswordVM : ViewModel {
    
    @Published var oldPassword = ""
    @Published var newPassword = ""
    @Published var reTypePassword = ""
}
