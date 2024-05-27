//
//  QuestionnaireView.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct QuestionnaireView: View {
    
    private struct Config {
        
        static let buttonTitle = "Next"
    }
    
    @State private var tabSelection = 1

    @StateObject private var vm = QuestionnaireVM()
    @Environment(\.dismiss) var dismiss
    
    @State private var moveToHealthData = false
    
    var body: some View {
        
        ZStack {
            
            loadView()
            
            if vm.showDatePicker {
                
                AgePickerMLB(showDatePicker: $vm.showDatePicker) { date in
                    
                    vm.age = DateManager.shared.getDateString(from: date)
                }
            }
        }
        .addBackground
        .onBackSwipe {
            
            withAnimation {
                if tabSelection > 1 {
                    tabSelection -= 1
                } else {
                    self.dismiss()
                }
            }
        }
        .navigationDestination(isPresented: $moveToHealthData) {
            
            ConnectHealthDataView()
                .hideNavigationBar
        }
    }
}

extension QuestionnaireView {
    
    func loadView() -> some View {
        
        VStack {
            
            VStack(spacing: 30) {
                
                topBar
                
                steps
            }
            .padding(.horizontal)
            
            ScrollView {
                
                HStack {
                    
                    switch tabSelection {
                        
                    case 1:
                        
                        ChooseGenderView(vm: vm)
                        
                    case 2:
                        
                        PrimaryGoalView(vm: vm)
                        
                    case 3:
                        
//                        FoodPreferenceView(vm: vm)
//                        
//                    case 4:
                        
                        PersonalDetailsView(vm: vm)
                        
                    case 4:
                        
                        DiabetesTypeView(vm: vm)
                        
                    default:
                        
                        Text("Hello World")
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.never)
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {
                
                withAnimation {
                    
                    if tabSelection < 4 {
                        tabSelection += 1
                    } else {
                        self.moveToHealthData.toggle()
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

extension QuestionnaireView {
    
    var topBar: some View {
        
        ZStack {
            
            QuestionnaireRectangles(tabSelection: tabSelection)
            
            HStack {
                
                Button(action: {
                    
                    withAnimation {
                        if tabSelection > 1 {
                            tabSelection -= 1
                        } else {
                            self.dismiss()
                        }
                    }
                    
                }, label: {
                    Image(systemName: "chevron.backward")
                        .padding(.trailing)
                })
                
                Spacer()
            }
        }
    }
    
    var steps: some View {
        
        Text("Step \(tabSelection)/4")
            .foregroundStyle(.accent)
            .font(.regular(size: 16))
    }
}

#Preview {
    QuestionnaireView()
}
