//
//  HeartRate.swift
//  Sokar
//
//  Created by Taimoor Arif on 08/05/2024.
//

import SwiftUI

struct HeartRate: View {
    
    private struct Config {
        
        static let heartRate = "Heart Rate"
        
        static let latest = "Latest"
        static let bpm = "BPM"
    }
    
    private var heartRate: Int
    
    init(heartRate: Int) {
        self.heartRate = heartRate
    }
    
    var body: some View {
        
        loadView
    }
}

extension HeartRate {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack {
        
            heartRateTitle
            
            heartRateData
        }
        .padding(15)
        .background {
            
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
}

extension HeartRate {
    
    @ViewBuilder
    var heartRateTitle: some View {
        
        HStack {
            
            ImageName.heartFill
                .resizable()
                .scaledToFit()
                .frame(width: 19, height: 16)
            
            Text(Config.heartRate)
                .foregroundStyle(.white)
                .font(.medium(size: 16))
            
            Spacer()
            
            NavigationLink {
                HeartRateView()
            } label: {
                dateText
            }
        }
    }
    
    @ViewBuilder
    var heartRateData: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(Config.latest)
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.regular(size: 14))
                
                Text("\(heartRate) ")
                    .foregroundStyle(.white)
                    .font(.medium(size: 25))
                +
                Text(Config.bpm)
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.regular(size: 14))
            }
            
            Spacer()
            
            ImageName.heartRate
                .resizable()
                .frame(width: 72, height: 42)
        }
    }
    
    @ViewBuilder
    var dateText: some View {
        
        HStack {
            
            Text(Date().toString("MMM dd"))
                .foregroundStyle(.white)
                .font(.regular(size: 15))
            
            Image(systemName: "chevron.forward")
                .resizable()
                .scaledToFit()
                .frame(width: 8, height: 12)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    HeartRate(heartRate: 116)
}
