//
//  PersonalDetailsView.swift
//  Sokar
//
//  Created by Taimoor Arif on 28/03/2024.
//

import SwiftUI

struct PersonalDetailsView: View {
    
    private struct Config {
        
        static let topTitle = "Set Personal Details"
        static let topDescription = "Add your personal details to personalize your profile."
        
        static let ageTitle = "Age"
        
        static let height = "Height"
        static let heightUnit = "cm"
        
        static let weight = "Weight"
        static let weightUnit = "KG"
    }
    
    @ObservedObject var vm: QuestionnaireVM
    
    var body: some View {
        
        loadView()
    }
}

extension PersonalDetailsView {
    
    func loadView() -> some View {
        
        VStack(spacing: 30) {
            
            ScreenTitle(title: Config.topTitle,
                        description: Config.topDescription)
            
            DatePickerTextfield(title: Config.ageTitle,
                                text: vm.age,
                                color: .white) {
                
                vm.showDatePicker.toggle()
            }
            
            bottomHeightWeight()
        }
    }
}

extension PersonalDetailsView {
    
    func bottomHeightWeight() -> some View {
        
        VStack(spacing: 30) {
           
            heightView()
            
            weightView()
        }
    }
    
    func heightView() -> some View {
        
        VStack(spacing: 10) {
            
            bottomHeading(title: Config.height,
                         unit: Config.heightUnit)
            
            Text("\(vm.height)")
                .foregroundStyle(.accent)
                .font(.regular(size: 25))
            
            WheelPicker(returnValue: $vm.height,
                        startPoint: 110,
                        endPoint: 190)
            .padding(.top)
        }
    }
    
    func weightView() -> some View {
        
        VStack(spacing: 10) {
           
            bottomHeading(title: Config.weight,
                         unit: Config.weightUnit)
            
            Text("\(vm.weight)")
                .foregroundStyle(.accent)
                .font(.regular(size: 25))
            
            WheelPicker(returnValue: $vm.weight,
                        startPoint: 30,
                        endPoint: 150)
            .padding(.top)
        }
    }
}

extension PersonalDetailsView {
    
    func bottomHeading(title: String, unit: String) -> some View {
        
        Group {
            
            Text("\(title)")
                .font(.medium(size: 19))
                .foregroundStyle(.white)
            +
            Text("/\(unit)")
                .font(.medium(size: 14))
                .foregroundStyle(.white.opacity(0.7))
        }
        
    }
}

#Preview {
    PersonalDetailsView(vm: QuestionnaireVM())
//    QuestionnaireView()
}
