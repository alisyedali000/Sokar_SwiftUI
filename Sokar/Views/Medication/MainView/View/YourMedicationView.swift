//
//  YourMedicationView.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import SwiftUI

struct YourMedicationView: View {
    
    @ObservedObject private var vm: MedicationReminderVM
    
    init(vm: MedicationReminderVM) {
        self.vm = vm
    }
    
    var body: some View {
        
        loadView
    }
}

extension YourMedicationView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 15) {
            
            ForEach(vm.allMedicines) { medication in
                
                NavigationLink {
                 
                    MedicineDetailView(medicine: medication)
                    
                } label: {
                    
                    YourMedicationCell(medication: medication)
                }
            }
            
            Spacer(minLength: 0.01)
        }
    }
}

#Preview {
    YourMedicationView(vm: MedicationReminderVM())
}
