//
//  EditProfileVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import Foundation
import UIKit

class EditProfileVM : ViewModel {
    
    @Published var image = UIImage(systemName: "person.circle.fill") ?? UIImage()
    @Published var base64Image = ""
    
    @Published var name = ""
    @Published var age = DateManager.shared.getDateString(from: Date())
 
    @Published var height: Int = 0
    @Published var weight: Int = 0
    
    @Published var showDatePicker = false
}
