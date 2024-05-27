//
//  QuestionnaireVM.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/03/2024.
//

import Foundation

class QuestionnaireVM : ViewModel {
    
    // quest 1
    
    @Published var genderSelection : GenderTypes = .none
    
    // quest 2
    @Published var selectedGoal = PrimaryGoal()
    
    // quest 3
    @Published var selectedPreferences : [FoodPreference] = []
    
    // quest 4
    
    @Published var showDatePicker = false
    @Published var age = DateManager.shared.getDateString(from: Date())
    
    @Published var height : Int = 110 // initial value
    @Published var weight : Int = 30 // initial value
    
    // quest 5
    @Published var selectedDiabetesType = DiabetesTypes()
}
