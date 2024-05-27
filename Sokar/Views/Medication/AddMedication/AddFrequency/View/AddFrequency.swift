//
//  AddFrequency.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import SwiftUI

struct AddFrequency: View {
    
    @State private var allCases: [FrequencyValues] = [.daily, .specificDays, .daysInterval, .menstrualCycle]
    
    @State private var weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    @State private var numbersArray = (2...99).map { String($0) }
    
    @State private var cyclesArray = ["21 Take, 7 Break", "22 Take, 6 Break", "23 Take, 5 Break", "24 Take, 4 Break", "25 Take, 3 Break", "26 Take, 2 Break", "27 Take, 1 Break", "28 Take, 0 Break"]
    
    @StateObject private var vm = AddFrequenyVM()
    
    @Binding private var selectedCase: FrequencyValues
    @Binding private var selectedDays: [String]
    @Binding private var day: String
    @Binding private var selectedCycle: String
    
    init(selectedCase: Binding<FrequencyValues>,
         selectedDays: Binding<[String]>,
         day: Binding<String>,
         selectedCycle: Binding<String>) {
        
        self._selectedCase = selectedCase
        self._selectedDays = selectedDays
        self._day = day
        self._selectedCycle = selectedCycle
    }
    
    var body: some View {
        
        loadView
            .onChange(of: selectedCase) { _ , newValue in
               
                vm.updateValues(from: newValue)
            }
            .onAppear {
                
                vm.selectedDays = selectedDays
                vm.days = day
                vm.selectedCycle = selectedCycle
            }
    }
}

extension AddFrequency {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(alignment: .leading, spacing: 15) {
           
            Text("Frequency")
                .font(.regular(size: 16))
                .foregroundStyle(.white)
            
            allCasesView
            
            if !(selectedCase == .none || selectedCase == .daily)  {
                
                Text("When to take")
                    .font(.regular(size: 16))
                    .foregroundStyle(.white)
                
                dataAgainstCases
            }
        }
    }
}

// MARK: Sub Views
extension AddFrequency {
    
    @ViewBuilder
    var allCasesView: some View {
        
        VStack {
            
            ForEach(allCases, id: \.self) { caseData in
                
                VStack {
                    
                    frequencyCase(caseData)
                    
                    if caseData != .menstrualCycle {
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.white.opacity(0.1))
                    }
                }
            }
        }
        .background {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
    
    @ViewBuilder
    func frequencyCase(_ caseData: FrequencyValues) -> some View {
        
        Button(action: {
            
            withAnimation(.smooth(duration: 0.5)) {
                
                self.selectedCase = caseData
            }
            
        }, label: {
            
            HStack {
                
                Text(caseData.title)
                    .font(.regular(size: 15))
                    .foregroundStyle(.white)
                    .lineLimit(1)
                
                Spacer(minLength: 0.01)
                
                if self.selectedCase == caseData {
                    
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 12)
                        .foregroundStyle(.accent)
                }
            }
            .padding(15)
        })
    }
}

// MARK: Data against Cases
extension AddFrequency {
    
    @ViewBuilder
    var dataAgainstCases: some View {
        
        VStack {
            
            Group {
                
                switch selectedCase {
                    
                case .daily:
                    
                    EmptyView()
                    
                case .specificDays:
                    
                    specificDays
                    
                case .daysInterval:
                    
                    daysInterval
                    
                case .menstrualCycle:
                    
                    menstrualCycle
                    
                case .none:
                    
                    EmptyView()
                }
            }
        }
    }
    
    @ViewBuilder
    var specificDays: some View {
        
        HStack {
         
            ForEach(weekdays, id: \.self) { day in
                
                Button {
                    
                    withAnimation(.smooth(duration: 0.25)) {
                        
                        if vm.selectedDays.contains(day) {
                            
                            // remove
                            
                            if let index = vm.selectedDays.firstIndex(of: day) {
                                
                                self.vm.selectedDays.remove(at: index)
                            }
                            
                        } else {
                            
                            // add
                            self.vm.selectedDays.append(day)
                        }
                    }
                    
                } label: {
                    
                    Spacer()
                    
                    dayCircle(title: day)
                    
                    Spacer()
                }
            }
        }
        .padding(13)
        .background {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
    
    @ViewBuilder
    func dayCircle(title: String) -> some View {
        
        ZStack {
            
            Circle()
                .frame(width: 40, height: 40)
                .foregroundStyle(vm.selectedDays.contains(title) ? .accent : .clear)
            
            Text(title.prefix(2))
                .foregroundStyle(vm.selectedDays.contains(title) ? .black : .white)
                .font(.regular(size: 15))
        }
    }
}

extension AddFrequency {
    
    @ViewBuilder
    var daysInterval: some View {
        
        VStack {
            
            daysIntervalSelection
            
            Picker("", selection: $vm.days) {
                
                ForEach(numbersArray, id: \.self) { number in
                    Text(number)
                    +
                    Text(" Days")
                }
            }
            .pickerStyle(.wheel)
        }
        .padding(10)
        .background {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
    
    @ViewBuilder
    var daysIntervalSelection: some View {
        
        VStack {
            
            HStack {
                
                Text("Days")
                    .font(.medium(size: 17))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("\(vm.days) Days")
                    .font(.regular(size: 14))
                    .foregroundStyle(.accent)
            }
            
            Rectangle()
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 1)
        }
    }
    
    @ViewBuilder
    var menstrualCycle: some View {
        
        VStack {
            
            mestrualCycleSelection
            
            Picker("", selection: $vm.selectedCycle) {
                
                ForEach(cyclesArray, id: \.self) { cycle in
                    Text(cycle)
                }
            }
            .pickerStyle(.wheel)
        }
        .padding(10)
        .background {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
    
    @ViewBuilder
    var mestrualCycleSelection: some View {
        
        Text(vm.selectedCycle)
            .font(.medium(size: 16))
            .foregroundStyle(.white)
        
        Rectangle()
            .foregroundStyle(.white.opacity(0.1))
            .frame(height: 1)
    }
}

#Preview {
    AddFrequency(selectedCase: .constant(.none), selectedDays: .constant([]), day: .constant(""), selectedCycle: .constant(""))
}
