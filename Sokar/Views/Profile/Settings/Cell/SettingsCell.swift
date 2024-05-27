//
//  SettingsCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import SwiftUI

struct SettingsCell: View {
    
    private var type: SettingsEnum
    
    init(type: SettingsEnum) {
        self.type = type
    }
    
    var body: some View {
        
        loadView
    }
}

// MARK: Load View
extension SettingsCell {
    
    var loadView: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 14)
                .foregroundColor(.white.opacity(0.1))
                .frame(height: 54)
            
            details
        }
    }
}

// MARK: Sub views
extension SettingsCell {
    
    var details: some View {
        
        HStack(spacing: 10) {
            
            type.image
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(type == .deleteAccount ? .red : .accent)
            
            Text(type.title)
                .font(.regular(size: 15))
                .foregroundStyle(type == .deleteAccount ? .red : .white)
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .resizable()
                .scaledToFit()
                .frame(width: 8, height: 13)
                .foregroundStyle(.accent)
        }
        .padding()
    }
}

#Preview {
//    SettingsCell(type: .changePassword)
    SettingsView()
}
