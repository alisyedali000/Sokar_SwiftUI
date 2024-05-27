//
//  InsulinCell.swift
//  Sokar
//
//  Created by Taimoor Arif on 08/05/2024.
//

import SwiftUI

struct InsulinCell: View {
    
    private var insulin: InsulinModel
    
    init(insulin: InsulinModel) {
        self.insulin = insulin
    }
    
    var body: some View {
      
        ZStack {
         
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.white.opacity(0.1))
                .frame(height: 71)
            
            loadView
        }
    }
}

extension InsulinCell {
    
    @ViewBuilder
    var loadView: some View {
        
        HStack {
            
            nameUnits
            
            Spacer(minLength: 0.01)
            
            glucoseLevel
        }
        .padding(.horizontal)
    }
}

extension InsulinCell {
    
    @ViewBuilder
    var nameUnits: some View {
        
        VStack(alignment: .leading) {
            
            Text("\(insulin.units) units")
                .foregroundStyle(.white)
                .font(.medium(size: 18))
            
            HStack(spacing: 10) {
                
                Text("Hamalog")
                
                Text("\u{2022}")
                
                Text(insulin.dateToDisplay)
            }
            .foregroundStyle(.white.opacity(0.7))
            .font(.light(size: 13))
        }
    }
    
    @ViewBuilder
    var glucoseLevel: some View {
        
        HStack {
          
            Text(insulin.glucoseLevel)
                .font(.regular(size: 14))
            
            Image(systemName: "arrow.up")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 12)
                .fontWeight(.medium)
        }
        .foregroundStyle(.accent)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .background {
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
}

#Preview {
    InsulinCell(insulin: insulinMock)
}
