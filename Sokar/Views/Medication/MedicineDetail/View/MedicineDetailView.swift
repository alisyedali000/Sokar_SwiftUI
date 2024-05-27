//
//  MedicineDetailView.swift
//  Sokar
//
//  Created by Taimoor Arif on 06/05/2024.
//

import SwiftUI

struct MedicineDetailView: View {
    
    private struct Config {
        
        static let screenTitle = "Medicine Detail"
        
        static let frequency = "Frequency"
        static let timings = "Timings"
        static let action = "Action"
        
        static let deleteMedication = "Delete Medication"
    }
    
    @State private var deleteAlert = false
    
    @State private var editType: AddMedicationType = .frequency
    @State private var moveToEditMed = false
    
    private var medicine: MedicationModel
    
    init(medicine: MedicationModel) {
        self.medicine = medicine
    }
    
    var body: some View {
        
        loadView
            .addBackground
            .alert("Are you sure you want to delete this medication?", isPresented: $deleteAlert) {
                
                Button("Yes", role: .destructive) {
                    
                }
            }
            .navigationDestination(isPresented: $moveToEditMed) {
                
                EditMedicineView(medicine: medicine,
                                 editType: editType)
            }
    }
}

// MARK: Load View
extension MedicineDetailView {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 20) {
            
            topImageView
            
            frequency
            
            timings
            
            deleteAction
            
            Spacer(minLength: 0.01)
        }
        .topHorizontalPadding
    }
}

// MARK: Sub Views
extension MedicineDetailView {
    
    @ViewBuilder
    var topImageView: some View {
        
        VStack {
            
            image
            
            Text(medicine.name)
                .foregroundStyle(.white)
                .font(.medium(size: 18))
            
            Text(medicine.startDate.toDateString("yyyy-MM-dd HH:mm:ss", returnFormat: "MMM dd, yyyy"))
                .foregroundStyle(.white.opacity(0.7))
                .font(.regular(size: 13))
        }
    }
    
    @ViewBuilder
    var image: some View {
        
        ZStack {
            
            Circle()
                .foregroundColor(.white.opacity(0.1))
                .frame(width: 86)
            
            ImageName.medicine
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
        }
    }
    
    @ViewBuilder
    var frequency: some View {
        
        VStack {
           
            title(Config.frequency) {
                
                self.editType = .frequency
                self.moveToEditMed.toggle()
            }
            
            HStack {
                
                Text(medicine.medCellValue)
                    .font(.regular(size: 15))
                    .foregroundStyle(.white.opacity(0.8))
                
                Spacer(minLength: 0.01)
            }
            .padding(15)
            .background {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white.opacity(0.1))
            }
        }
    }
    
    @ViewBuilder
    var timings: some View {
        
        VStack {
            
            title(Config.timings) {
                
                self.editType = .time
                self.moveToEditMed.toggle()
            }
            
            VStack {
                
                ForEach(medicine.notifiedTime) { time in
                    
                    VStack {
                        
                        MedicineTimeCell(medTime: time)
                            .padding(15)
                        
                        if time != medicine.notifiedTime.last {
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white.opacity(0.1))
                        }
                    }
                }
            }
            .background {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white.opacity(0.1))
            }
        }
    }
    
    @ViewBuilder
    var deleteAction: some View {
        
        VStack(alignment: .leading) {
            
            Text(Config.action)
                .foregroundStyle(.white)
                .font(.medium(size: 16))
            
            Button(action: {
                
                self.deleteAlert.toggle()
                
            }, label: {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.white.opacity(0.1))
                        .frame(height: 54)
                    
                    HStack {
                        
                        Image(systemName: "trash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 20)
                            .foregroundStyle(.red)
                        
                        Text(Config.deleteMedication)
                            .foregroundStyle(.red)
                            .font(.medium(size: 15))
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            })
        }
    }
}

extension MedicineDetailView {
    
    @ViewBuilder
    func title(_ titleText: String, action: @escaping () -> Void) -> some View {
        
        HStack {
            
            Text(titleText)
                .foregroundStyle(.white)
                .font(.medium(size: 16))
            
            Spacer()
            
            Button(action: {
                action()
            }, label: {
                
                ImageName.pencil
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 16)
            })
        }
    }
}

#Preview {
    MedicineDetailView(medicine: medicationMock)
}
