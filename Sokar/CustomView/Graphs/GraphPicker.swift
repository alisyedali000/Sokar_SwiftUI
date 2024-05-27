//
//  GraphPicker.swift
//  Sokar
//
//  Created by Taimoor Arif on 01/05/2024.
//

import SwiftUI

struct GraphPicker: View {
    
    @State private var allCases: [GraphType] = [.hour, .day, .week, .month, .sixMonth, .year]
    
    @Binding private var tabSelection: GraphType
    
    init(tabSelection: Binding<GraphType>) {
        
        self._tabSelection = tabSelection
        
        let appearence = UISegmentedControl.appearance()
        
        appearence.backgroundColor = Color.white.opacity(0.1).uiColor
        
        appearence.selectedSegmentTintColor = .accent
        
        appearence.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        
        appearence.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        
        loadView
    }
}

extension GraphPicker {
    
    @ViewBuilder
    var loadView: some View {
        
        Group {
            
            Picker("", selection: $tabSelection) {
                
                ForEach(allCases, id: \.self) { value in
                    
                    Text(value.title)
                        .font(.regular(size: 15))
                        .tag(value)
                }
            }
            .frame(height: 42)
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    GraphPicker(tabSelection: .constant(.hour))
}
