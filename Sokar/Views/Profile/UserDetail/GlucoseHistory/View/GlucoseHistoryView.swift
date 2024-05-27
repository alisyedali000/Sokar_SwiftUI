//
//  GlucoseHistoryView.swift
//  Sokar
//
//  Created by Taimoor Arif on 01/05/2024.
//

import SwiftUI

struct GlucoseHistoryView: View {
    
    private struct Config {
        
        static let screenTitle = "Glucose Summary"
        
        static let highest = "Highest"
        static let lowest = "Lowest"
        
        static let avgGlucoseLevel = "Avg Glucose Level"
        static let levelValue = "Mg/dL"
    }
    
    @StateObject private var vm = GlucoseHistoryVM()
    
    var body: some View {
        
        loadView
            .addBackground
            .addNavigationTitle(title: Config.screenTitle)
    }
}

// MARK: Load View
extension GlucoseHistoryView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            GraphPicker(tabSelection: $vm.selectedType)
            
            SeparatorLine()
            
            highestLowest
            
            graph
            
            avgGlucose
            
            Spacer()
        }
        .topHorizontalPadding
    }
}

// MARK: Sub Views
extension GlucoseHistoryView {
    
    @ViewBuilder
    var highestLowest: some View {
        
        HStack(spacing: 15) {
            
            glucoseValue(title: Config.highest,
                         image: "arrow.up.right.circle.fill",
                         value: "\(vm.calculateValues().2)",
                         color: .accent)
            
            glucoseValue(title: Config.lowest,
                         image: "arrow.down.right.circle.fill",
                         value: "\(vm.calculateValues().1)",
                         color: .red)
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

extension GlucoseHistoryView {
    
    @ViewBuilder
    func glucoseValue(title: String, image: String, value: String, color: Color) -> some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 97)
            
            HStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    glucoseValueTop(title: title, image: image, color: color)
                    
                    Text(value)
                        .foregroundStyle(color)
                        .font(.medium(size: 29))
                    +
                    Text(Config.levelValue)
                        .foregroundStyle(.white.opacity(0.7))
                        .font(.regular(size: 16))
                }
                
                Spacer(minLength: 0.01)
            }
            .padding(12)
        }
    }
    
    @ViewBuilder
    func glucoseValueTop(title: String, image: String, color: Color) -> some View {
        
        HStack {
            
            Text(title)
                .font(.light(size: 14))
                .foregroundStyle(.white.opacity(0.7))
            
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(color)
        }
    }
}

#Preview {
    GlucoseHistoryView()
}
