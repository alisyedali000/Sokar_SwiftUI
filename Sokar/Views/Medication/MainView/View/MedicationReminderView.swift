//
//  MedicationReminderView.swift
//  Sokar
//
//  Created by Taimoor Arif on 05/04/2024.
//

import SwiftUI

struct MedicationReminderView: View {
    
    private struct Config {
        
        static let screenTitle = "Medication Reminder"
        
        static let nextMedicine = "Time To Take Next Medicine"
        
        static let todaysMedicine = "Today's Medicines"
        static let seeAll = "See All"
        
        static let emptyMedicines = "No Today's Medicines"
    }
    
    @StateObject private var vm = MedicationReminderVM()
    
    @State private var typeSelection: MedicationSegmentType = .todaysLog
    
    @State private var moveToAddMedicine = false
    
    var body: some View {
        
        loadView()
            .addBackground
            .addBottomSpace
            .onAppear(perform: {
                vm.updateValues()
            })
            .navigationDestination(isPresented: $moveToAddMedicine) {
                
                AddMedicationView()
                    .hideNavigationBar
            }
    }
}

extension MedicationReminderView {
    
    func loadView() -> some View {
        
        ZStack(alignment: .bottomTrailing) {
                
                VStack(spacing: 20) {
                    
                    topTitle
                    
                    MedicationSegment(typeSelection: $typeSelection)
                    
                    bottomView
                    
                    Spacer(minLength: 0.001)
                }
                .padding(.horizontal)
            
            if typeSelection == .yourMedication {
                
                PlusButton {
                    self.moveToAddMedicine.toggle()
                }
                .padding()
                .padding([.trailing, .bottom], 10)
            }
        }
    }
}

extension MedicationReminderView {
    
    @ViewBuilder
    var topTitle: some View {
        
        ZStack {
            
            Text(Config.screenTitle)
                .foregroundStyle(.white)
                .font(.medium(size: 18))
            
            HStack {
                
                Spacer()
                
                NavigationLink {
                    
                    MedicationByDateView()
                    
                } label: {
                    
                    Image(systemName: "hourglass.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(.accent, .white.opacity(0.1))
                }
            }
        }
    }
    
    @ViewBuilder
    var bottomView: some View {
        
        ScrollView {
            
            switch typeSelection {
                
            case .todaysLog:
                
                TodaysLogView(vm: vm)
                
            case .yourMedication:
                
                YourMedicationView(vm: vm)
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    MedicationReminderView()
}
