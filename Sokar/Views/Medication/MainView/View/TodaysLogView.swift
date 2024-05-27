//
//  TodaysLogView.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import SwiftUI

struct TodaysLogView: View {
    
    private struct Config {
        
        static let nextMedicine = "Time To Take Next Medicine"
        
        static let todaysMedicine = "Today's Medicines"
        static let seeAll = "See All"
        
        static let emptyMedicines = "No Today's Medicines"
    }
    
    @ObservedObject private var vm: MedicationReminderVM
    
    init(vm: MedicationReminderVM) {
        self.vm = vm
    }
    
    var body: some View {
        
        loadView
    }
}

extension TodaysLogView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            topCard
            
            pillsView()
            
            medicinesView()
        }
    }
}

extension TodaysLogView {
    
    var topCard: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 19)
                .foregroundStyle(.accent)
                .frame(height: 136)
            
            HStack {
                
                cardText
            
                Spacer()
                
                cardImage
            }
        }
    }
    
    var cardText: some View {
        
        VStack(alignment: .leading) {
            
            Text(Config.nextMedicine)
                .foregroundStyle(.black)
                .font(.medium(size: 18))
            
            HStack {
                
                ImageName.clock
                    .resizable()
                    .scaledToFit()
                    .frame(width: 23, height: 23)
                
                Text("09:00 PM")
                    .foregroundStyle(Color.appOrange)
                    .font(.regular(size: 17))
            }
        }
        .padding(.leading)
    }
    
    var cardImage: some View {
        
        ImageName.medicineCard
            .resizable()
            .scaledToFit()
            .frame(width: 169, height: 119)
    }
}

extension TodaysLogView {
    
    func pillsView() -> some View {
        
        HStack {
            
            PillsView(type: .tick, value: vm.taken)
            
            PillsView(type: .cross, value: vm.remaining)
        }
    }
    
    func medicinesView() -> some View {
        
        VStack(spacing: 15) {
            
            medicineTitle
            
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
    
    var medicineTitle: some View {
        
        HStack {
            
            Text(Config.todaysMedicine)
                .foregroundStyle(.white)
                .font(.medium(size: 18))
            
            Spacer()
        }
    }
}

#Preview {
    TodaysLogView(vm: MedicationReminderVM())
}
