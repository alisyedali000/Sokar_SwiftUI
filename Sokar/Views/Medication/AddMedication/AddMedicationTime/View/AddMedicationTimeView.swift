//
//  AddNotificationTimeView.swift
//  Sokar
//
//  Created by Taimoor Arif on 07/05/2024.
//

import SwiftUI

struct AddMedicationTimeView: View {
    
    private struct Config {
        
        static let wantNotified = "When do you want to be notified?"
    }
    
    @StateObject private var vm = AddMedicationTimeVM()
    
    @State private var openTimePickerSheet = false
    
    @Binding private var notifiedTimes: [MedicineTime]
    
    init(notifiedTimes: Binding<[MedicineTime]>) {
        
        self._notifiedTimes = notifiedTimes
    }
    
    var body: some View {
        
        loadView
            .sheet(isPresented: $openTimePickerSheet, content: {
                
                TimePickerSheet { date in
                    
                    // done tapped
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        
                        let time = DateManager.shared.timeInAmPm(from: date)
                        
                        let medTime = MedicineTime(time: time, quantity: 1)
                        
                        notifiedTimes.append(medTime)
                    }
                    
                    self.openTimePickerSheet.toggle()
                }
            })
    }
}

extension AddMedicationTimeView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack {
            
            Text(Config.wantNotified)
                .foregroundStyle(.white)
                .font(.regular(size: 16))
            
            allTimes
            
            Spacer(minLength: 0.001)
        }
    }
}

extension AddMedicationTimeView {
    
    @ViewBuilder
    var allTimes: some View {
        
        VStack {
            
            ForEach(notifiedTimes) { time in
                
                timeCell(time: time)
            }
            
            addBtn
        }
    }
    
    @ViewBuilder
    func timeCell(time: MedicineTime) -> some View {
        
        HStack {
            
            timeView(time)
            
            Button(action: {
                
                withAnimation {
                    
                    if let index = notifiedTimes.firstIndex(of: time) {
                        
                        notifiedTimes.remove(at: index)
                    }
                }
                
            }, label: {
                
                Image(systemName: "multiply.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 49, height: 40)
                    .foregroundStyle(.white, .red)
            })
        }
    }
    
    @ViewBuilder
    func timeView(_ time: MedicineTime) -> some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 44)
            
            HStack {
                
                Text(time.time)
                    .foregroundStyle(.white)
                    .font(.regular(size: 16))
                
                Spacer()
                
                Menu {
                    
                    ForEach(vm.numbersArray, id: \.self) { quantity in
                        
                        Button("\(quantity)") {
                            
                            if let index = notifiedTimes.firstIndex(of: time) {
                                
                                notifiedTimes[index].quantity = quantity
                            }
                        }
                    }
                    
                } label: {
                    
                    Text("\(time.quantity) tablet")
                        .foregroundStyle(.accent)
                        .font(.regular(size: 13))
                }

            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    var addBtn: some View {
        
        Button(action: {
            
            self.openTimePickerSheet.toggle()
            
        }, label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white.opacity(0.1))
                    .frame(height: 44)
                
                HStack {
                    
                   Image(systemName: "plus.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text("Add")
                        .foregroundStyle(.accent)
                        .font(.regular(size: 16))
                }
            }
        })
    }
}

#Preview {
    AddMedicationTimeView(notifiedTimes: .constant([]))
}
