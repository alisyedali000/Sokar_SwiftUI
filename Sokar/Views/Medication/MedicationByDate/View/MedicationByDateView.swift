//
//  MedicationByDateView.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

struct MedicationByDateView: View {
    
    private struct Config {
        
        static let screenTitle = "Medication Reminder"
        
        static let emptyMedicines = "No Today's Medicines"
    }
    
    @StateObject private var vm = MedicationByDateVM()
    
    @State private var openCalendar = false
    
    var body: some View {
        
        ZStack {
            
            loadView
            
            if openCalendar {
                
                DatePickerMLB(showDatePicker: $openCalendar) { date in  
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        
                        vm.selectedDate = date
                    }
                }
            }
        }
        .addBackground
        .addNavigationTitle(title: Config.screenTitle)
        .onAppear(perform: {
            vm.updateValues()
        })
        .toolbar(content: {
            
            toolBarButton
        })
    }
}

// MARK: Load View
extension MedicationByDateView {
    
    var loadView: some View {
        
        VStack {
            
            calendarView
            
            dataByDate
            
            Spacer()
        }
        .topHorizontalPadding
    }
}

// MARK: SubViews
extension MedicationByDateView {
    
    var calendarView: some View {
        
        VStack {
           
            CalendarView(calendarDate: $vm.selectedDate)
        }
    }
    
    var dataByDate: some View {
        
        VStack {
            
            pillsView
            
            medicinesView
        }
    }
    
    var pillsView: some View {
        
        HStack {
            
            PillsView(type: .tick, value: vm.taken)
            
            PillsView(type: .cross, value: vm.remaining)
        }
    }
    
    var medicinesView: some View {
        
        VStack(spacing: 15) {
            
            if vm.allMedicines.isEmpty {
                
                EmptyStatesView(image: ImageName.emptyMedications,
                                text: Config.emptyMedicines)
                
            } else {
                
                ForEach($vm.allMedicines) { medicine in
                    
                    MedicineCell(medicine: medicine,
                                 allMedicines: $vm.allMedicines,
                                 taken: $vm.taken,
                                 remaining: $vm.remaining)
                }
            }
        }
    }
}

// MARK: Tool bar button
extension MedicationByDateView {
    
    @ViewBuilder
    var toolBarButton: some View {

        Button {
            self.openCalendar.toggle()
        } label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 11)
                    .frame(width: 35, height: 35)
                    .foregroundStyle(.white.opacity(0.1))
                
                ImageName.calendar
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
        }
    }
}

#Preview {
    MedicationByDateView()
}
