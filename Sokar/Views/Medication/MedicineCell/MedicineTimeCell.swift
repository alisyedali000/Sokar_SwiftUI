//
//  MedicineTimeCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import SwiftUI

struct MedicineTimeCell: View {
    
    private var medTime: MedicineTime
    
    init(medTime: MedicineTime) {
        self.medTime = medTime
    }
    
    var body: some View {
        
        HStack {
            
            Text(medTime.time)
                .font(.regular(size: 15))
                .foregroundStyle(.white)
            
            Spacer()
            
            Text("\(medTime.quantity) Tablet")
                .font(.regular(size: 13))
                .foregroundStyle(.white.opacity(0.7))
        }
    }
}

#Preview {
    MedicineTimeCell(medTime: MedicineTime(time: "09:00 am", quantity: 1))
}
