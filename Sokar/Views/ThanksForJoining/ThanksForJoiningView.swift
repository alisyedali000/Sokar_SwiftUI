//
//  ThanksForJoiningView.swift
//  Sokar
//
//  Created by Taimoor Arif on 04/04/2024.
//

import SwiftUI

struct ThanksForJoiningView: View {
    
    private struct Config {
        
        static let youAreThere = "You are there"
        static let thanksJoining = "Thanks For Joining!!"
        static let getGoing = "Let's Get Going"
        static let goodToSee = "Good to see you here"
        static let willPlan = "will plan your all plans to manage glucose level"
        
        static let buttonTitle = "Finish"
    }
    
    @State private var rotation : Double = 0.0
    
    @State private var moveToSugarCoat = false
    
    @State private var imageAnimation = false
    
    var body: some View {
        
        loadView()
            .addBackground
            .navigationDestination(isPresented: $moveToSugarCoat) {
                
                SugarCoatView()
                    .hideNavigationBar
            }
            .onAppear(perform: {
                
                withAnimation(.smooth(duration: 1.0)) {
                    self.imageAnimation = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    
                    withAnimation(.smooth(duration: 1.5)) {
                        
                        self.rotation = -28
                    }
                }
            })
    }
}

extension ThanksForJoiningView {
    
    func loadView() -> some View {
        
        VStack {
            
            topImage()
            
            middleText()
                .padding(.horizontal)
            
            Spacer(minLength: 0.01)
            
            DefaultButton(title: Config.buttonTitle) {
                self.moveToSugarCoat.toggle()
            }
            .padding(.horizontal)
        }
    }
}

extension ThanksForJoiningView {
    
    func topImage() -> some View {
        
        ZStack {
            
            let screenSize = UIScreen.main.bounds
            
            ImageName.handBackground
                .resizable()
                .scaledToFit()
                .frame(width: screenSize.width - 10,
                       height: screenSize.height / 2)
                .scaleEffect(imageAnimation ? 1 : 0.1)
            
            ImageName.handMobile
                .resizable()
                .scaledToFit()
                .frame(width: screenSize.width - 10,
                       height: screenSize.height / 1.8)
                .rotationEffect(.degrees(rotation))
                .offset(x: 75, y: 70)
                .swipeAnimation(startAnimation: imageAnimation, xOffset: 1)
            
//            ImageName.thanksForJoining
//                .resizable()
//                .scaledToFill()
//                .frame(width: screenSize.width - 10,
//                       height: screenSize.height / 1.5)
//                .clipped()
//                .padding(.leading)
        }
//        .padding(.top, 20)
    }
    
    func middleText() -> some View {
        
        VStack(spacing: 10) {
            
            VStack(spacing: 0) {
                Text(Config.youAreThere)
                    .font(.regular(size: 15))
                    .foregroundStyle(.accent)
                
                Text(Config.thanksJoining)
                    .font(.medium(size: 28))
                    .foregroundStyle(.white)
                
                Text(Config.getGoing)
                    .font(.medium(size: 28))
                    .foregroundStyle(.white)
            }
            
            Group {
                
                Text(Config.goodToSee)
                    .foregroundStyle(.white.opacity(0.8))
                +
                Text(" Sokar ")
                    .foregroundStyle(.accent)
                +
                Text(Config.willPlan)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .font(.regular(size: 15))
            .multilineTextAlignment(.center)
            .showFullText
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

#Preview {
    ThanksForJoiningView()
}
