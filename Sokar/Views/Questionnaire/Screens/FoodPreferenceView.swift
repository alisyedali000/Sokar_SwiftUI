//
//  FoodPreferenceView.swift
//  Sokar
//
//  Created by Taimoor Arif on 28/03/2024.
//

import SwiftUI

struct FoodPreferenceView: View {
    
    private struct Config {
        
        static let topTitle = "Food Preference"
        static let topDescription = "Select your diet preferences so that we can customized your meal plans"
    }
    
    private var columns = [GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible())]
    
    @ObservedObject var vm: QuestionnaireVM
    
    init(vm: QuestionnaireVM) {
        self.vm = vm
    }
    
    @State private var startAnimation = false
    
    var body: some View {
        
        loadView()
            .onAppear(perform: {
                startAnimation = true
            })
    }
}

extension FoodPreferenceView {
    
    func loadView() -> some View {
        
        VStack {
            
            ScreenTitle(title: Config.topTitle,
                        description: Config.topDescription)
            
            allFoods()
            
            Spacer()
        }
    }
}

extension FoodPreferenceView {
    
    func allFoods() -> some View {
        
        VStack {
            
            LazyVGrid(columns: columns) {
                
                ForEach(foodPreferences) { preference in
          
                    if preference == foodPreferences.last {
                        Spacer()
                    }
                    
                    preferenceView(preference: preference)
                }
            }
        }
    }
    
    func preferenceView(preference: FoodPreference) -> some View {
        
        Button(action: {
            
            withAnimation(.smooth(duration: 0.5)) {
                
                if vm.selectedPreferences.contains(preference) {
                    
                    // remove
                    vm.selectedPreferences.removeAll(where: { $0 == preference })
                } else {
                    vm.selectedPreferences.append(preference)
                }
            }
            
        }, label: {
            
            ZStack {
              
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white.opacity(0.1))
                    .frame(height: 112)
                    .overlay {
                
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(vm.selectedPreferences.contains(preference) ? .accent : .clear, lineWidth: 1.0)
                    }
                
                VStack {
                    
                    preference.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                    
                    Text(preference.name)
                        .foregroundStyle(.white)
                        .font(.regular(size: 13))
                }
            }
        })
        .swipeAnimation(startAnimation: startAnimation, xOffset: preference.xOffset, yOffset: preference.yOffset)
    }
}

#Preview {
    FoodPreferenceView(vm: QuestionnaireVM())
//    QuestionnaireView()
}

struct FoodPreference: Identifiable, Equatable {
    
    let id = UUID().uuidString
    var image: Image
    var name: String
    var xOffset: CGFloat
    var yOffset: CGFloat
}

extension FoodPreference {
    
    init() {
        
        self.image = Image("")
        self.name = ""
        self.xOffset = 0
        self.yOffset = 0
    }
}

let foodPreferences = [

    FoodPreference(image: ImageName.vegetarian, name: "Vegetarian", xOffset: -1, yOffset: -1),
    
    FoodPreference(image: ImageName.vegan, name: "Vegan", xOffset: 0, yOffset: -1),
    
    FoodPreference(image: ImageName.gluten, name: "Glutan Free", xOffset: 1, yOffset: -1),
    
    FoodPreference(image: ImageName.lowCarb, name: "Low Carbs", xOffset: -1, yOffset: 0),
    
    FoodPreference(image: ImageName.lowFat, name: "Low Fat", xOffset: 1, yOffset: 1),
    
    FoodPreference(image: ImageName.keto, name: "Keto", xOffset: 1, yOffset: 0),
    
    FoodPreference(image: ImageName.pescat, name: "Pescatarian", xOffset: 0, yOffset: 1)
]
