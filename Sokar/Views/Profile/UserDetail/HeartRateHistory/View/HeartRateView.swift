//
//  HeartRateView.swift
//  Sokar
//
//  Created by Taimoor Arif on 03/05/2024.
//

import SwiftUI

struct HeartRateView: View {
    
    private struct Config {
        
        static let screenTitle = "Heart Rate"
        
        static let range = "Range"
        
        static let avgGlucoseLevel = "Avg Heart Rate"
        static let levelValue = "BPM"
    }
    
    @StateObject private var vm = GlucoseHistoryVM()
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
    }
}

// MARK: Load View
extension HeartRateView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            GraphPicker(tabSelection: $vm.selectedType)
            
            SeparatorLine()
            
            range
            
            graph
            
            avgGlucose
            
            Spacer()
        }
        .topHorizontalPadding
    }
}

// MARK: Sub Views
extension HeartRateView {
    
    @ViewBuilder
    var range: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text(Config.range)
                    .foregroundStyle(.white.opacity(0.6))
                    .font(.regular(size: 16))
                
                Text("\(vm.calculateValues().1)-\(vm.calculateValues().2) ")
                    .foregroundStyle(.white)
                    .font(.medium(size: 32))
                +
                Text(Config.levelValue)
                    .foregroundStyle(.white.opacity(0.6))
                    .font(.regular(size: 16))
                
                Text(Date().toString("MMM dd, yyyy"))
                    .foregroundStyle(.white.opacity(0.75))
                    .font(.regular(size: 16))
            }
            
            Spacer(minLength: 0.01)
        }
    }
    
    @ViewBuilder
    var graph: some View {
        
        HStack {
          
            GlucoseGraph(glucoseData: vm.selectedType.array,
                         unit: vm.selectedType.dateComponent,
                         dateFormat: "")
        }
    }
    
    @ViewBuilder
    var avgGlucose: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 13)
                .frame(height: 50)
                .foregroundStyle(.white.opacity(0.1))
            
            HStack {
                
                Text(Config.avgGlucoseLevel)
                    .foregroundStyle(.white)
                    .font(.regular(size: 15))
                
                Spacer()
                
                Group {
                    
                    Text("\(vm.calculateValues().0) ")
                        .foregroundStyle(.white)
                    +
                    Text(Config.levelValue)
                        .foregroundStyle(.white.opacity(0.6))
                }
                .font(.regular(size: 16))
            }
            .padding(12)
        }
    }
}

#Preview {
    HeartRateView()
}
