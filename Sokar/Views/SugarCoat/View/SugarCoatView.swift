//
//  SugarCoatView.swift
//  Sokar
//
//  Created by Taimoor Arif on 03/04/2024.
//

import SwiftUI

struct SugarCoatView: View {
    
    private struct Config {
        
        static var description = "Start your journey to a healthier life now"
        
        static var buttonTitle = "Sweet! I'm in!"
    }
    
    @State private var startAnimation = false
    @State private var scallingAnimation = false
    @State private var textAnimation = false
    @State private var buttonAnimation = false
    
    @State private var moveToHome = false
    
    var body: some View {
        
        loadView()
            .addBackground
            .onAppear(perform: {
                
                withAnimation(.smooth(duration: 0.5)) {
                    startAnimation = true
                }
                
                withAnimation(.smooth(duration: 1.0)) {
                    scallingAnimation = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                 
                    withAnimation(.smooth(duration: 1.0)) {
                        textAnimation = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                 
                    withAnimation(.smooth(duration: 1.0)) {
                        buttonAnimation = true
                    }
                }
            })
            .navigationDestination(isPresented: $moveToHome) {
                
                TabBarController()
                    .hideNavigationBar
            }
    }
}

extension SugarCoatView {
    
    func loadView() -> some View {
        
        VStack {
            
            topImages()
            
//            VStack {
                
                middleTitles()
                
            Spacer(minLength: 0.01)
            
                DefaultButton(title: Config.buttonTitle) {
                   
                    self.moveToHome.toggle()
                }
                .swipeAnimation(startAnimation: textAnimation, yOffset: 1)
//            }
        }
        .padding(.horizontal)
    }
}

extension SugarCoatView {
    
    func topImages() -> some View {
        
        VStack(spacing: 5) {
            
            let screenSize = UIScreen.main.bounds
            
            HStack {
                
                ImageName.sugarcoatOne
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenSize.width / 2.2, height: screenSize.height / 4.0)
                    .swipeAnimation(startAnimation: startAnimation, xOffset: -1)
                
                Spacer(minLength: 0.05)
                
                ImageName.sugarcoatTwo
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scallingAnimation ? 1 : 0.1)
                    .frame(width: screenSize.width / 2.2, height: screenSize.height / 4.0)
            }
            
            HStack {
                
                ImageName.sugarcoatThree
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scallingAnimation ? 1 : 0.1)
                    .frame(width: screenSize.width / 2.2, height: screenSize.height / 4.0)
                
                Spacer(minLength: 0.05)
                
                ImageName.sugarcoatFour
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenSize.width / 2.2, height: screenSize.height / 4.0)
                    .swipeAnimation(startAnimation: startAnimation, xOffset: 1)
            }
            
        }
    }
    
    func middleTitles() -> some View {
        
        VStack(spacing: 20) {
            
            VStack(spacing: 5) {
                
                firstLine
                
                secondLine
                
                Text("are important")
                    .foregroundStyle(.white)
            }
            .font(.medium(size: 28))
            .swipeAnimation(startAnimation: textAnimation, xOffset: -1)
            .padding(.top, 10)
            
            Text("Start your journey to a healthier\n life now")
                .foregroundStyle(.white)
                .font(.light(size: 18))
                .multilineTextAlignment(.center)
                .showFullText
                .swipeAnimation(startAnimation: textAnimation, xOffset: 1)
                
        }
    }
    
    var firstLine: some View {
        
        HStack {
            
            Text("Let's not")
                .foregroundStyle(.white)
            
            Text("Sugar coat it")
                .foregroundStyle(.black)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background {
                    
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundStyle(.accent)
                }
        }
        
    }
    
    var secondLine: some View {
        
        HStack {
            
            Text("Your")
                .foregroundStyle(.white)
            
            Text("Glucose levels")
                .foregroundStyle(.accent)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background {
                    
                    RoundedRectangle(cornerRadius: 13)
                        .foregroundStyle(.white.opacity(0.1))
                }
        }
//        .font(.medium(size: 28))
    }
}

#Preview {
    SugarCoatView()
}
