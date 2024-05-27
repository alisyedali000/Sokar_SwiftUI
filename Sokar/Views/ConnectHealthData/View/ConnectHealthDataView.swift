//
//  ConnectHealthDataView.swift
//  Sokar
//
//  Created by Taimoor Arif on 03/04/2024.
//

import SwiftUI

struct ConnectHealthDataView: View {
    
    private struct Config {
        
        static let connectData = "Connect Your Health Data"
        static var topDescription = "Enhance Your Fitness Journey with Integrated Health Data"
        
        static var bottomTitle = "Request for Permission"
        static var bottomDescription = "Allow ROXFIT to access your health data from Apple Health for a more personalized fitness experience."
        
        static var skipBtn = "Skip"
        
        static var buttonTitle = "Connect To Apple Health"
    }
    
    @State private var moveToThanksJoining = false
    
    @State private var startAnimation = false
    @State private var buttonAnimation = false
    
    var body: some View {
        
        loadView()
            .addBackground
            .navigationDestination(isPresented: $moveToThanksJoining) {
                
                ThanksForJoiningView()
                    .hideNavigationBar
            }
            .onAppear(perform: {
                
                withAnimation(.smooth(duration: 0.5)) {
                    startAnimation = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        buttonAnimation = true
                    }
                }
            })
    }
}

extension ConnectHealthDataView {
    
    func loadView() -> some View {
        
        VStack(spacing: 30) {
            
            skipBtn
            
            VStack(spacing: 30) {
                
                heartImage
                
                topData
            }
            .swipeAnimation(startAnimation: startAnimation, xOffset: -1)
            
            Spacer()
            
            bottomData
            
            DefaultButton(title: Config.buttonTitle) {
                self.moveToThanksJoining.toggle()
            }
            .swipeAnimation(startAnimation: buttonAnimation, yOffset: 1)
        }
        .padding(.horizontal)
    }
}

extension ConnectHealthDataView {
    
    var skipBtn: some View {
        
        HStack {
            
            Spacer()
            
            NavigationLink {
                
                SugarCoatView()
                    .hideNavigationBar
                
            } label: {
                
                Text(Config.skipBtn)
                    .foregroundStyle(.accent)
                    .font(.medium(size: 16))
            }
        }
    }
    
    var heartImage: some View {
        
        ZStack(alignment: .topTrailing) {
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(.white.opacity(0.1))
                .frame(width: 137, height: 136)
            
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 62, height: 55)
                .foregroundStyle(.accent)
                .padding([.top, .trailing], 22)
        }
    }
    
    var topData: some View {
        
        VStack(spacing: 15) {
            
            Text(Config.connectData)
                .foregroundStyle(.white)
                .font(.regular(size:23))
                .multilineTextAlignment(.center)
            
            Text(Config.topDescription)
                    .font(.light(size: 14))
                    .foregroundStyle(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
        }
    }
    
    var bottomData: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(Config.bottomTitle)
                    .foregroundStyle(.white)
                    .font(.medium(size: 18))
                    .multilineTextAlignment(.center)
                
                Text(Config.bottomDescription)
                        .font(.light(size: 13))
                        .foregroundStyle(.white.opacity(0.8))
                        .multilineTextAlignment(.leading)
            }
            
            Spacer(minLength: 0.05)
        }
        .swipeAnimation(startAnimation: startAnimation, xOffset: 1)
    }
}

#Preview {
    ConnectHealthDataView()
}
