//
//  OrView.swift
//  Innate
//
//  Created by Taimoor Arif on 30/11/2023.
//

import SwiftUI

struct OrView: View {
    
    private var colors: [Color] = [.black, .accentColor]
    
    var body: some View {
        
        HStack {
            
            LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing)
                .frame(height: 1)
            
            Text("Or")
                .font(.regular(size: 14))
                .foregroundStyle(.accent)
            
            LinearGradient(colors: colors, startPoint: .trailing, endPoint: .leading)
                .frame(height: 1)
        }
    }
}

#Preview {
    OrView()
}
