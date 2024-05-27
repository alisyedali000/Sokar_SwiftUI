//
//  PrimaryGoalView.swift
//  Sokar
//
//  Created by Taimoor Arif on 28/03/2024.
//

import SwiftUI

struct PrimaryGoalView: View {
    
    private struct Config {
        
        static let topTitle = "Your primary goal"
        static let topDescription = "To craft the most effective recommendations for you, please share your main objective with"
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

extension PrimaryGoalView {
    
    func loadView() -> some View {
        
        VStack(spacing: 15) {
            
            ScreenTitle(title: Config.topTitle,
                        description: Config.topDescription,
                        showAppName: true)
            
            ForEach(primaryGoals) { goal in
                
                singleGoalView(goal: goal)
            }
            
            Spacer()
        }
    }
}

extension PrimaryGoalView {
    
    func singleGoalView(goal: PrimaryGoal) -> some View {
        
        Button(action: {
            
            withAnimation(.smooth(duration: 0.5)) {
                self.vm.selectedGoal = goal
            }
            
        }, label: {
            
            ZStack {
             
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(.white.opacity(0.1))
                    .frame(height: 87)
                    .overlay {
                        
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(vm.selectedGoal == goal ? .accent : .clear, lineWidth: 2.0)
                    }
                
                goalView(goal: goal)
            }
        })
        .swipeAnimation(startAnimation: startAnimation, xOffset: goal.xOffset)
    }
    
    func goalView(goal: PrimaryGoal) -> some View {
        
        HStack(spacing: 15) {
            
            goal.image
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            
            details(goal: goal)
        }
        .padding()
    }
    
    func details(goal: PrimaryGoal) -> some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(goal.title)
                    .foregroundStyle(.white)
                    .font(.medium(size: 15))
                
                Spacer()
                
                Image(systemName: vm.selectedGoal == goal ? "circle.fill" : "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
            
            Text(goal.description)
                .foregroundStyle(.white.opacity(0.8))
                .font(.light(size: 13))
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    PrimaryGoalView(vm: QuestionnaireVM())
//    QuestionnaireView()
}

struct PrimaryGoal : Identifiable, Equatable {
    
    let id = UUID().uuidString
    var image: Image
    var title: String
    var description: String
    var xOffset: CGFloat
}

extension PrimaryGoal {
    
    init() {
        
        self.image = Image("")
        self.title = ""
        self.description = ""
        self.xOffset = 0
    }
}

let primaryGoals = [

    PrimaryGoal(image: ImageName.glucoseStability, title: "Glucose Stability", description: "Achieve consistent glucose levels for holistic well- being", xOffset: 1),
    
    PrimaryGoal(image: ImageName.doExercise, title: "Do exercise to Shape body", description: "Balance diet for wellness with glucose management", xOffset: 1.5),
    
    PrimaryGoal(image: ImageName.preDiabetic, title: "Pre-Diabetic Management", description: "Adopt a diet tailored to manage and reduce diabetic risk", xOffset: 2.0),
    
    PrimaryGoal(image: ImageName.nutrition, title: "Nutrition Optimization", description: "Balance diet for wellness with glucose management", xOffset: 2.5),
]
