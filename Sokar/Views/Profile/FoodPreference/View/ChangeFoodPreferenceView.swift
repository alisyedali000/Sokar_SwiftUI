//
//  ChangeFoodPreferenceView.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import SwiftUI

struct ChangeFoodPreferenceView: View {
    
    private struct Config {
        
        static let screenTitle = "Change Food Preference"
        static let topDescription = "Select your diet preferences so that we can customized your meal plans"
        
        static let buttonTitle = "Update"
    }
    
    private var columns = [GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible())]
    
    @StateObject private var vm = ChangeFoodPreferenceVM()
    
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

extension ChangeFoodPreferenceView {
    
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            topDescription
            
            allFoods
            
            Spacer()
            
            DefaultButton(title: Config.buttonTitle) {
                
            }
        }
        .topHorizontalPadding
    }
}

extension ChangeFoodPreferenceView {
    
    var topDescription: some View {
        
        HStack {
            
            Text(Config.topDescription)
                .font(.light(size: 15))
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.leading)
            
            Spacer(minLength: 0.01)
        }
    }
    
    var allFoods: some View {
        
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
    ChangeFoodPreferenceView()
}
