//
//  MedicineCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 15/04/2024.
//

import SwiftUI

struct MedicineCell: View {
    
//    @State var isTake = false
    
    @Binding private var medicine: MedicationModel
    @Binding private var allMedicines: [MedicationModel]
    @Binding private var taken: Double
    @Binding private var remaining: Double
    
    init(medicine: Binding<MedicationModel>,
         allMedicines: Binding<[MedicationModel]>,
         taken: Binding<Double>,
         remaining: Binding<Double>) {
        
        self._medicine = medicine
        self._allMedicines = allMedicines
        self._taken = taken
        self._remaining = remaining
    }
    
    var body: some View {
        
        loadView()
    }
}

extension MedicineCell {
    
    func loadView() -> some View {
        
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

extension MedicineCell {
    
    var medicineImage: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 11)
                .foregroundStyle(.white.opacity(0.1))
                .frame(width: 80, height: 80)
            
            ImageName.medicine
                .resizable()
                .scaledToFit()
                .frame(width: 37, height: 37)
        }
    }
    
    func medicineData() -> some View {
        
        VStack(alignment: .leading) {
            
            medName
            
            Text(medicine.medCellValue)
                .foregroundStyle(.white.opacity(0.7))
                .font(.regular(size: 12))
            
            time
        }
    }
    
    var medName: some View {
        
        HStack(alignment: .top) {
            
            Text(medicine.name)
                .lineLimit(1)
                .foregroundStyle(.white)
                .font(.medium(size: 17))
            
            Spacer()
            
            Button(action: {
                
                withAnimation(.bouncy(duration: 0.5)) {
                    
                    self.medicine.isTaken.toggle()

                    taken = medicine.isTaken ? taken + 1 : taken - 1
                    remaining = medicine.isTaken ? remaining - 1 : remaining + 1
                }
                
            }, label: {
                
                Group {

                    // write if-else because flip animation works like this
                    if medicine.isTaken {
                        
                        Image(systemName: "checkmark.square.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .transition(.reverseFlip)
                    } else {
                        
                        Image(systemName: "checkmark.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .transition(.flip)
                    }
                }
            })
        }
    }
    
    var time: some View {
        
        HStack {
            
            ImageName.clockBlue
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text(medicine.notifiedTime.first?.time ?? "")
                .foregroundStyle(.white.opacity(0.9))
                .font(.regular(size: 13))
        }
    }
}

#Preview {
    MedicationReminderView()
//    MedicineCell(medicine: medicationMock, allMedicines: .constant([]), taken: .constant(0), remaining: .constant(0))
}
