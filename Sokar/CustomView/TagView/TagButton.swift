//
//  SkillButton.swift
//  Unified
//
//  Created by Qazi Ammar Arshad on 15/07/2022.
//

import SwiftUI

struct TagButton: View {

    @State private var rotation: Double = 0
//    @State private var changeColor = true
//    @State var hideCross = false
    
    private var title: String
    private var showCross: Bool = false
    private var crossAction: (String) -> Void

    init(title: String, showCross: Bool = false, crossAction: @escaping (String) -> Void) {
        
        self.title = title
        self.showCross = showCross
//        self.isSelfUser = isSelfUser
        self.crossAction = crossAction
    }
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .lineLimit(1)
                .font(.regular(size: 13))
                .foregroundColor(.white)
            
            if showCross {
                Button(action: {
                    self.crossAction(title)
                }, label: {
                    Image(systemName: "multiply")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 9, height: 9)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .rotationEffect(.degrees(rotation))
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true)) {
                                rotation = 10 // Adjust the value to control the amount of shake
                            }
                        }
                        .onDisappear {
                            rotation = 0
                        }
                })
            }
            
        }
        .padding(showCross ? .leading : .horizontal)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white.opacity(0.09))
//                .foregroundColor(changeColor ? .appGreenColor : .textFieldBackground)
        )
        .onAppear {
            
//            self.changeColor = !isSelfUser && title.isMatched ? true : false
        }
    }
}

struct TagButton_Previews: PreviewProvider {
    static var previews: some View {
        TagButton(title: "Travel", showCross: true, crossAction: {_ in})
    }
}
