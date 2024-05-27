//
//  MedicationSegment.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import SwiftUI

struct MedicationSegment: View {
    
    @Binding private var typeSelection: MedicationSegmentType
    
    @State private var allCases: [MedicationSegmentType] = [.todaysLog, .yourMedication]
    
    init(typeSelection: Binding<MedicationSegmentType>) {
        
        self._typeSelection = typeSelection
        
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

extension MedicationSegment {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack {
            
            Picker("", selection: $typeSelection) {
                
                ForEach(allCases, id: \.self) { value in
                    
                    Text(value.title)
                        .font(.regular(size: 14))
                        .tag(value)
                }
            }
            .frame(height: 42)
            .pickerStyle(.segmented)
            
        }
    }
}

#Preview {
    MedicationSegment(typeSelection: .constant(.todaysLog))
}

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)  // << here !!
    }
}
