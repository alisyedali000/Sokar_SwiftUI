//
//  YourMedicationCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import SwiftUI

struct YourMedicationCell: View {
    
    private var medication: MedicationModel

    init(medication: MedicationModel) {
        self.medication = medication
    }
    
    var body: some View {
        
        loadView
    }
}

extension YourMedicationCell {
    
    @ViewBuilder
    var loadView: some View {
        
        HStack {
            
            medicineImage
            
            medicineData()
        }
        .padding(.leading, 12)
        .padding(.trailing, 18)
        .padding(.vertical, 15)
        .background {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
}

extension YourMedicationCell {
    
    var medicineImage: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 11)
                .foregroundStyle(.white.opacity(0.1))
                .frame(width: 56, height: 56)
            
            ImageName.medicine
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26)
        }
    }
    
    func medicineData() -> some View {
        
        VStack(alignment: .leading) {
            
            medName
            
            Text(medication.medCellValue)
                .foregroundStyle(.white.opacity(0.7))
                .font(.regular(size: 12))

        }
    }
    
    var medName: some View {
        
        HStack {
            
            Text(medication.name)
                .lineLimit(1)
                .foregroundStyle(.white)
                .font(.medium(size: 17))
            
            Spacer()
            
            Image(systemName: "arrow.forward")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 12)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    YourMedicationCell(medication: medicationMock)
}
