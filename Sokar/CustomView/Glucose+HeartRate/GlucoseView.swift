//
//  GlucoseView.swift
//  Sokar
//
//  Created by Taimoor Arif on 08/05/2024.
//

import SwiftUI

struct GlucoseView: View {
    
    private struct Config {
        static let glucoseHistory = "Glucose History"
    }
    
    private var glucoseData: [GlucoseModel]
    private var title: String = "Glucose History"
    private var value: String = Date().toString("MMM dd")
    private var valueColor: Color = .white
    
    init(glucoseData: [GlucoseModel],
         title: String = "Glucose History",
         value: String = Date().toString("MMM dd"),
         valueColor: Color = .white) {
        
        self.glucoseData = glucoseData
        self.title = title
        self.value = value
        self.valueColor = valueColor
    }
    
    var body: some View {
        loadView
    }
}

extension GlucoseView {
    
    @ViewBuilder
    var loadView: some View {
        VStack {
            // title
            glucoseTitle
            
            GlucoseGraph(glucoseData: glucoseData,
                         unit: .hour, dateFormat: "d MMM")
        }
    }
}

extension GlucoseView {
    
    @ViewBuilder
    var glucoseTitle: some View {
        HStack {
            Text(title)
                .foregroundStyle(.white)
                .font(.medium(size: 20))
            
            Spacer()
            
            NavigationLink {
                GlucoseHistoryView()
            } label: {
                dateText
            }
        }
    }
    
    @ViewBuilder
    var dateText: some View {
        HStack {
            Text(value)
                .foregroundStyle(valueColor)
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
    GlucoseView(glucoseData: glucoseSingleDayMockArray)
}
