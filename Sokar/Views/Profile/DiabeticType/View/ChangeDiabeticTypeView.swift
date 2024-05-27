//
//  ChangeDiabeticTypeView.swift
//  Sokar
//
//  Created by Taimoor Arif on 24/04/2024.
//

import SwiftUI

struct ChangeDiabeticTypeView: View {
    
    private struct Config {
        
        static let screenTitle = "Change Diabetic Type"
        
        static let buttonTitle = "Update"
    }
    
    @StateObject private var vm = ChangeDiabeticTypeVM()
    
    @State private var startAnimation = false
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
            .onAppear(perform: {
                startAnimation = true
            })
    }
}

extension ChangeDiabeticTypeView {
    
    var loadView: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                diabetesTypes
                
                Spacer()
                
                DefaultButton(title: Config.buttonTitle) {
                    
                }
            }
            .topHorizontalPadding
        }
        .scrollIndicators(.never)
    }
}

extension ChangeDiabeticTypeView {
    
    var diabetesTypes: some View {
        
        VStack {
            
            ForEach(diabetesTypesArray) { type in
                
                singleType(type: type)
            }
        }
    }
    
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
    ChangeDiabeticTypeView()
}
