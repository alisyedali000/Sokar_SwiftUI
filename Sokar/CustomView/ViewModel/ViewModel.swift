//
//  ViewModel.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var showLoader = false
    
    func showError(message: String) {
        
        DispatchQueue.main.async {
            self.errorMessage = message
            self.showError = true
        }
    }
}
