//
//  ChooseGenderView.swift
//  Sokar
//
//  Created by Taimoor Arif on 27/03/2024.
//

import SwiftUI

struct ChooseGenderView: View {
    
    private struct Config {
        
        static let topTitle = "Which one are you?"
        static let topDescription = "Please choose your gender in order to get started"
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

extension ChooseGenderView {
    
    func loadView() -> some View {
        
        VStack(spacing: 40) {
            
            ScreenTitle(title: Config.topTitle,
                        description: Config.topDescription)
            
            genders()
            
            Spacer()
        }
    }
}

extension ChooseGenderView {
    
    func genders() -> some View {
        
        VStack(spacing: 40) {
            
            Button {
             
                withAnimation(.smooth(duration: 0.5)) {
                    self.vm.genderSelection = .male
                }
                
            } label: {
                
                genderView(type: .male,
                           stroke: vm.genderSelection == .male ? .accent : .clear,
                           xOffset: -1)
            }
            
            Button {
             
                withAnimation(.smooth(duration: 0.5)) {
                    self.vm.genderSelection = .female
                }
                
            } label: {
                
                genderView(type: .female,
                           stroke: vm.genderSelection == .female ? .accent : .clear,
                           xOffset: 1)
            }
        }
    }
    
    func genderView(type: GenderTypes, stroke: Color, xOffset: CGFloat = 0) -> some View {
        
        VStack {
            ZStack {
                
                Circle()
                    .foregroundStyle(.white.opacity(0.10))
                    .frame(width: 150, height: 150)
                    .overlay {
                        Circle()
                            .stroke(stroke, lineWidth: 2.0)
                            .frame(width: 150, height: 150)
                    }
                
                type.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
            }
            
            Text(type.title)
                .font(.regular(size: 18))
                .foregroundStyle(.white)
        }
        .swipeAnimation(startAnimation: startAnimation, xOffset: xOffset)
    }
}

#Preview {
//    ChooseGenderView()
    QuestionnaireView()
}

enum GenderTypes {
    
    case male
    case female
    case none
}

extension GenderTypes {
    
    var title: String {
        
        switch self {
            
        case .male:
            
            return "Male"
            
        case .female:
            
            return "Female"
            
        case .none:
            
            return ""
        }
    }
    
    var image: Image {
        
        switch self {
            
        case .male:
            
            return ImageName.male
            
        case .female:
            
            return ImageName.female
            
        case .none:
            
            return Image("")
        }
    }
}
