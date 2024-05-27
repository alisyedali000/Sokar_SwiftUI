//
//  AddMedicationView.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct AddMedicationView: View {
    
    private struct Config {
        
        static let screenTitle = "Add Medication Reminder"
        
        static let medicineName = "Medicine Name"
        static let namePlaceholder = "Enter Medicine Name"
        static let nameImage = ImageName.bandages
        
        static let frequency = "Frequency"
        static let frequencyImage = ImageName.pencilFill
        
        static let startDate = "Start Date"
        static let calendarImage = ImageName.calendar
        
        static let wantNotified = "When do you want to be notified?"
        
        static let buttonTitle1 = "Next"
        static let buttonTitle2 = "Done"
    }
    
    @State private var tabSelection: AddMedicationType = .name
    
    @State private var openCalendar = false
    
    @StateObject private var vm = AddMedicationVM()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            loadView()
            
            if openCalendar {
            
                DatePickerMLB(showDatePicker: $openCalendar) { date in
                    vm.startDate = date
                }
            }
        }
        .addBackground
        .onBackSwipe {
            backButtonAction()
        }
    }
}

extension AddMedicationView {
    
    func loadView() -> some View {
        
        VStack(spacing: 30) {
            
            topBarScreenImage
            
            tabBarItems()
            
            Spacer(minLength: 0.001)
            
            DefaultButton(title: tabSelection == .time ? Config.buttonTitle2 : Config.buttonTitle1) {
                
              bottomButtonAction()
            }
        }
        .padding(.horizontal)
    }
}

extension AddMedicationView {
    
    var topBarScreenImage: some View {
        
        VStack(spacing: 40) {
            
            navBar
            
            ZStack {
                
                Circle()
                    .foregroundStyle(.white.opacity(0.1))
                    .frame(width: 86, height: 86)
                
                ImageName.medicine
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
        }
    }
    
    var navBar: some View {
        
        ZStack {
            
            Text(Config.screenTitle)
                .foregroundStyle(.white)
                .font(.medium(size: 18))
            
            HStack {
                
                Button(action: {
                    
                    backButtonAction()
                    
                }, label: {
                    
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 18)
                })
                
                Spacer()
            }
        }
    }
    
    func tabBarItems() -> some View {
        
        VStack {
            
            switch tabSelection {
                
            case .name:
                
                nameTextfield
                
            case .frequency:
                
                ScrollView {
                    
                    frequency()
                }
                .scrollIndicators(.hidden)
                
            case .time:
                
                ScrollView {
                    
                    AddMedicationTimeView(notifiedTimes: $vm.notifiedTimes)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

extension AddMedicationView {
    
    @ViewBuilder
    var nameTextfield: some View {
        
        CustomTextField(text: $vm.medicineName,
                        title: Config.medicineName,
                        placeholder: Config.namePlaceholder,
                        image: Config.nameImage)
    }
    
    func frequency() -> some View {
        
        VStack(spacing: 15) {
            
            AddFrequency(selectedCase: $vm.frequency,
                         selectedDays: $vm.specificDays,
                         day: $vm.daysInterval,
                         selectedCycle: $vm.menstrualCycle)
            
            ActionableTextfield(title: Config.startDate,
                                image: Config.calendarImage,
                                text: DateManager.shared.getDateString(from: vm.startDate)) {
                
                // add action
                
                self.openCalendar.toggle()
            }
            
            Spacer()
        }
    }
}

extension AddMedicationView {
    
    func backButtonAction() {
       
        switch tabSelection {
            
        case .name:
            
            self.dismiss()
            
        case .frequency:
            
            self.tabSelection = .name
            
        case .time:
            
            self.tabSelection = .frequency
        }
    }
    
    func bottomButtonAction() {
       
        switch tabSelection {
            
        case .name:
            
            self.tabSelection = .frequency
            
        case .frequency:
            
            self.tabSelection = .time
            
        case .time:
            
            self.dismiss()
        }
    }
}

#Preview {
    AddMedicationView()
}
