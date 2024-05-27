//
//  EditMedicineView.swift
//  Sokar
//
//  Created by Taimoor Arif on 07/05/2024.
//

import SwiftUI

struct EditMedicineView: View {
    
    private struct Config {
        
        static let screenTitle = "Edit Medication"
        
        static let buttonTitle = "Done"
    }
    
    private var medicine: MedicationModel
    private var editType: AddMedicationType
    
    init(medicine: MedicationModel, editType: AddMedicationType) {
        self.medicine = medicine
        self.editType = editType
    }
    
    @StateObject private var vm = EditMedicineVM()
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
            .onAppear {
                
                vm.updateValues(medicine: medicine)
            }
    }
}

// MARK: Load View
extension EditMedicineView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack {
            
            ScrollView {
                
                topImage
                
                screenTypeView
            }
            .scrollIndicators(.never)
            
            Spacer(minLength: 0.01)
            
            if editType == .frequency {
                
                DefaultButton(title: Config.buttonTitle) {
                    
                }
            }
        }
        .topHorizontalPadding
    }
}

extension EditMedicineView {
    
    @ViewBuilder
    var topImage: some View {
        
        ZStack {
            
            Circle()
                .foregroundStyle(.white.opacity(0.1))
                .frame(width: 86)
            
            ImageName.medicine
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
        }
    }
    
    @ViewBuilder
    var frequencyView: some View {
        
        VStack {
            
            AddFrequency(selectedCase: $vm.frequency,
                         selectedDays: $vm.specificDays,
                         day: $vm.daysInterval,
                         selectedCycle: $vm.menstrualCycle)
        }
    }
}

extension EditMedicineView {
    
    @ViewBuilder
    var screenTypeView: some View {
        
        switch editType {
            
        case .frequency:
            
            frequencyView
            
        case .time:
            
            AddMedicationTimeView(notifiedTimes: $vm.notifiedTimes)
            
        case .name:
            
            EmptyView()
        }
    }
}

#Preview {
    EditMedicineView(medicine: medicationMock, editType: .frequency)
}
