//
//  ConnectedDeviceCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import SwiftUI

struct ConnectedDeviceCell: View {
    
    private var device: ConnectedDevices
    
    init(device: ConnectedDevices) {
        self.device = device
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load view
extension ConnectedDeviceCell {
    
    var loadView: some View {
        
        ZStack {
           
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 64)
            
            details
        }
    }
    
    var details: some View {
        
        HStack(spacing: 10) {
            
            ImageName.transmitter
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
            
            Text(device.name)
                .foregroundStyle(.white)
                .font(.regular(size: 15))
                .lineLimit(1)
            
            Spacer(minLength: 0.01)
        }
        .padding()
    }
}

#Preview {
    ConnectedDeviceCell(device: ConnectedDevices(name: "Glucose Device", image: "tray.circle.fill"))
}
