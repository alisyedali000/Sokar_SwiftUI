//
//  GlucoseSummaryCard.swift
//  Sokar
//
//  Created by Taimoor Arif on 08/05/2024.
//

import SwiftUI

struct GlucoseSummaryCard: View {
    
    private struct Config {
        
        static let greatJob = "Great job, "
        static let topDescription = "Your Glucose levels are on the track today."
        
        static let bottomDescription = "Stay hydrated, and opt for balanced snacks for sustained energy. Consistency is key to maintaining healthy glucose levels."
        static let keepUp = "Keep it up!"
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load View
extension GlucoseSummaryCard {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 10) {
           
            topView
            
            Rectangle()
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 1)
            
            bottomText
            
            keepUpView
        }
        .padding(.vertical, 15)
        .background {
            
            LinearGradient(colors: [Color(hex: "#DADADA").opacity(0.06), .white.opacity(0.1)], startPoint: .leading, endPoint: .trailing)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
    }
}

// MARK: Sub Views
extension GlucoseSummaryCard {

    @ViewBuilder
    var topView: some View {
        
        HStack(spacing: 10) {
            
            ImageName.clapEmoji
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            
            VStack(alignment: .leading) {
                
                Group {
                    
                    Text(Config.greatJob)
                    +
                    Text("\(userMock.name)!")
                }
                .foregroundStyle(.white)
                .font(.medium(size: 17))
                
                Text(Config.topDescription)
                    .foregroundStyle(.white.opacity(0.8))
                    .font(.light(size: 13))
            }
            
            Spacer(minLength: 0.01)
        }
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    var bottomText: some View {
        
        HStack {
            
            Text(Config.bottomDescription)
                .foregroundStyle(.white.opacity(0.8))
                .font(.light(size: 13))
                .multilineTextAlignment(.leading)
            
            Spacer(minLength: 0.001)
        }
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    var keepUpView: some View {
        
        HStack {
         
            Text(Config.keepUp)
                .foregroundStyle(.accent)
                .font(.regular(size: 16))
            
            ImageName.eyeBlinkEmoji
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Spacer(minLength: 0.01)
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    GlucoseSummaryCard()
}
