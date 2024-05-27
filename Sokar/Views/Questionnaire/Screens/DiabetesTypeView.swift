//
//  DiabetesTypeView.swift
//  Sokar
//
//  Created by Taimoor Arif on 29/03/2024.
//

import SwiftUI

struct DiabetesTypeView: View {
    
    private struct Config {
        
        static let topTitle = "What type of diabetes do you have?"
        static let topDescription = ""
    }
    
    @ObservedObject var vm: QuestionnaireVM
    
    @State private var startAnimation = false
    
    var body: some View {
        
        loadView()
            .onAppear(perform: {
                startAnimation = true
            })
    }
}

extension DiabetesTypeView {
    
    func loadView() -> some View {
        
//        ScrollView {
            
            VStack(spacing: 15) {
                
                ScreenTitle(title: Config.topTitle,
                            description: Config.topDescription)
                
                ForEach(diabetesTypesArray) { type in
                    
                    singleType(type: type)
                }
                
                Spacer()
            }
//        }
//        .scrollIndicators(.never)
    }
}

extension DiabetesTypeView {
    
    func singleType(type: DiabetesTypes) -> some View {
        
        Button(action: {
            
            withAnimation(.smooth(duration: 0.5)) {
                self.vm.selectedDiabetesType = type
            }
            
        }, label: {
            
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Text(type.title)
                        .font(.medium(size: 18))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    let image = Image(systemName: vm.selectedDiabetesType == type ? "circle.fill" : "circle")
                    
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.accent)
                }
                
                TagView(tags: type.categories, showCross: false, crossAction: {_ in})
            }
            .padding(12)
            .background {
                
                RoundedRectangle(cornerRadius: 18)
                    .foregroundStyle(.white.opacity(0.1))
                    .overlay {
                        
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(vm.selectedDiabetesType == type ? .accent : .clear, lineWidth: 2.0)
                    }
            }
            .swipeAnimation(startAnimation: startAnimation, xOffset: type.xOffset)
        })
    }
}

#Preview {
    DiabetesTypeView(vm: QuestionnaireVM())
//    QuestionnaireView()
}

struct DiabetesTypes: Identifiable, Hashable {
    
    let id = UUID().uuidString
    var title: String
    var categories: [String]
    var xOffset: CGFloat
}

extension DiabetesTypes {
    
    init() {
        self.title = ""
        self.categories = []
        self.xOffset = 0
    }
}

let diabetesTypesArray = [

    DiabetesTypes(title: "Type 1 diabetes", categories: ["Excessive thirst", "Frequent Urination", "Weakness", "Weight Loss", "Acetone Smell"], xOffset: 1.0),
    
    DiabetesTypes(title: "Type 2 diabetes", categories: ["Excessive hunger & thirst", "Numbness loss", "Long wound healing", "Weakness"], xOffset: 1.5),
    
    DiabetesTypes(title: "Prediabetes", categories: ["Excessive hunger & thirst", "Weight gain", "Fatique", "Frequent Urination"], xOffset: 2.0)
]
