//
//  HomeView.swift
//  Sokar
//
//  Created by Taimoor Arif on 05/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    private struct Config {
        
        static let hey = "Hey, "
        static let trackGlucose = "Track your glucose with us"
        
        static let pairTransmitter = "Pair Transmitter"
        static let transmitterDescription = "Please Pair Your Transmitter\nHere"
        static let pair = "Pair"
        
        static let glucoseTitle = "Your Glucose"
        static let glucoseSymbol = "Mg/dl"
        static let glucoseValue = "View All"
        
        static let insulinTitle = "Insulin"
        static let viewHistory = "View History"
        static let newEntryTitle = "New Entry"
        
        static let dailyGlucoseSummary = "Daily Glucose Summary"
        
        static let sensorDescription = "The System is detected a sensor please confirm that it is a used one or a  new sensor"
        static let newSensor = "New Sensor"
        static let usedSensor = "Used One"
        
        static let warmingUp = "Sensor Is Warming Up"
        static let waitWarmingUp = "Please wait your sensor is warming up"
        static let minSymbol = "Min"
        
        static let nowTitle = "Now"
        static let lifeSpan = "Your sensor life span is approx. 14 days"
    }
    
    @StateObject private var vm = HomeVM()
    
    @State private var addInsulin = false
    @State private var moveToPairTransmitter = false
    
    @State private var transmitterCase: HomeCases = .pairTransmitter
    
    var body: some View {
        
        loadView
            .addBackground
            .addBottomSpace
            .sheet(isPresented: $addInsulin, content: {
                
                AddInsulinSheet {
                    self.addInsulin.toggle()
                }
            })
            .navigationDestination(isPresented: $moveToPairTransmitter) {
                
                PairTransmitterView {
                    
                    withAnimation(.smooth(duration: 0.5)) {
                        
                        self.transmitterCase = .usedNewTransmitter
                    }
                }
            }
            .onChange(of: transmitterCase) { _, newValue in
                
                if newValue == .warmingUp {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        
                        withAnimation(.smooth(duration: 0.5)) {
                            
                            self.transmitterCase = .transmitterData
                        }
                    }
                }
            }
    }
}

// MARK: Load View
extension HomeView {
    
    @ViewBuilder
    var loadView: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                
                topBar
                
                topTransmitterCaseView
                
                GlucoseView(glucoseData: vm.glucoseData,
                            title: Config.glucoseTitle,
                            value: Config.glucoseValue,
                            valueColor: .accent)
                
                HeartRate(heartRate: vm.hearRate)
                
                insulinView
                
                glucoseSummary
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
}

// MARK: top bar
extension HomeView {
    
    @ViewBuilder
    var topBar: some View {
        
        HStack(spacing: 10) {
            
            vm.user.image
                .resizable()
                .scaledToFill()
                .frame(width: 46, height: 46)
                .clipShape(Circle())
                .foregroundStyle(.accent)
            
            name
            
            Spacer(minLength: 0.1)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white.opacity(0.1))
                    .frame(width: 45, height: 45)
                
                Image(systemName: "bell.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
            }
        }
    }
    
    @ViewBuilder
    var name: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text(Config.hey)
                +
                Text(vm.user.name)
            }
            .foregroundStyle(.white)
            .font(.regular(size: 18))
            
            Text(Config.trackGlucose)
                .font(.light(size: 12))
                .foregroundStyle(.white.opacity(0.7))
        }
    }
}

// MARK: Transmitter
extension HomeView {
    
    @ViewBuilder
    var pairTransmitter: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(Config.pairTransmitter)
                    .foregroundStyle(.accent)
                    .font(.medium(size: 17))
                
                Text(Config.transmitterDescription)
                    .foregroundStyle(.white.opacity(0.7))
                    .font(.light(size: 12))
                
                pairButton
            }
            
            Spacer(minLength: 0.01)
            
            ImageName.transmitter
                .resizable()
                .scaledToFit()
                .frame(width: 89, height: 89)
        }
        .padding()
        .background {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
    
    @ViewBuilder
    var pairButton: some View {
        
        Group {
            
            Button(action: {
                self.moveToPairTransmitter.toggle()
            }, label: {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.accent, lineWidth: 1.0)
                        .frame(width: 94, height: 28)
                    
                    Text(Config.pair)
                        .foregroundStyle(.accent)
                        .font(.medium(size: 13))
                }
            })
        }
    }
}

// MARK: Insulin + Glucose Summary
extension HomeView {
    
    @ViewBuilder
    var insulinView: some View {
        
        VStack(spacing: 15) {
            
            insulinTitle
            
            ForEach(vm.insulinArray) { insulin in
                
                InsulinCell(insulin: insulin)
            }
            
            DefaultButton(title: Config.newEntryTitle) {
                
                self.addInsulin.toggle()
            }
        }
    }
    
    @ViewBuilder
    var insulinTitle: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                Text(Config.insulinTitle)
                    .font(.medium(size: 20))
                    .foregroundStyle(.white)
                
                Spacer(minLength: 0.1)
                
                NavigationLink {
                    
                    InsulinHistoryView()
                    
                } label: {
                    
                    Text(Config.viewHistory)
                        .font(.regular(size: 14))
                        .foregroundStyle(.accent)
                }
            }
            
            Text("\(vm.getTotalInsulinUnits()) units Total")
                .font(.light(size: 14))
                .foregroundStyle(.white.opacity(0.6))
        }
    }
    
    @ViewBuilder
    var glucoseSummary: some View {
        
        VStack(alignment: .leading) {
         
            Text(Config.dailyGlucoseSummary)
                .foregroundStyle(.white)
                .font(.medium(size: 20))
            
            GlucoseSummaryCard()
        }
    }
}

// MARK: Transmitter Scenarios
extension HomeView {
    
    @ViewBuilder
    var topTransmitterCaseView: some View {
        
        Group {
            
            switch transmitterCase {
                
            case .pairTransmitter:
                
                pairTransmitter
                
            case .usedNewTransmitter:
                
                usedOrNewSensorView
                
            case .warmingUp:
                
                sensorWarmingUp
                
            case .transmitterData:
                
                sensorReady
            }
        }
    }
    
    @ViewBuilder
    var usedOrNewSensorView: some View {
        
        VStack {
            
            Text(Config.sensorDescription)
                .foregroundStyle(.black)
                .font(.regular(size: 15))
                .multilineTextAlignment(.center)
            
            HStack(spacing: 20) {
                
                newSensorButton
                
                usedSensorButton
            }
        }
        .padding()
        .background {
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.accent)
        }
    }
    
    @ViewBuilder
    var newSensorButton: some View {
        
        Button {
           
            withAnimation(.smooth(duration: 0.5)) {
                
                self.transmitterCase = .warmingUp
            }
            
        } label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 21)
                    .frame(height: 32)
                    .foregroundStyle(.black)
                
                Text(Config.newSensor)
                    .foregroundStyle(.white)
                    .font(.regular(size: 13))
            }
        }
    }
    
    @ViewBuilder
    var usedSensorButton: some View {
        
        Button {
            
            withAnimation(.smooth(duration: 0.5)) {
                
                self.transmitterCase = .warmingUp
            }
            
        } label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 21)
                    .stroke(.black, lineWidth: 1.0)
                    .frame(height: 32)
                
                Text(Config.usedSensor)
                    .foregroundStyle(.black)
                    .font(.regular(size: 13))
            }
        }
    }
    
    @ViewBuilder
    var sensorWarmingUp: some View {
        
        VStack {
            
            sensorTitles(title: Config.warmingUp,
                         description: Config.waitWarmingUp)
            
            sensorValues(value: "60",
                         symbol: Config.minSymbol)
        }
    }
    
    @ViewBuilder
    var sensorReady: some View {
        
        VStack {
            
            sensorTitles(title: Config.nowTitle,
                         description: Config.lifeSpan)
            
            sensorValues(value: "122",
                         symbol: Config.glucoseSymbol.lowercased())
        }
    }
}

extension HomeView {
    
    @ViewBuilder
    func sensorTitles(title: String, description: String) -> some View {
        
        VStack {
            
            Text(title)
                .foregroundStyle(.accent)
                .font(.medium(size: 20))
            
            Text(description)
                .foregroundStyle(.white.opacity(0.7))
                .font(.light(size: 13))
        }
    }
    
    @ViewBuilder
    func sensorValues(value: String, symbol: String) -> some View {
        
        ZStack {
            
            Circle()
                .frame(height: 150)
                .foregroundStyle(.white.opacity(0.2))
            
            Circle()
                .frame(height: 112)
                .foregroundStyle(.white)
            
            VStack(spacing: -5) {
                
                Text(value)
                    .foregroundStyle(.black)
                    .font(.medium(size: 24))
                
                Text(symbol)
                    .foregroundStyle(.black)
                    .font(.regular(size: 17))
            }
        }
    }
}

#Preview {
    HomeView()
}
