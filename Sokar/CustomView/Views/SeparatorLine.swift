//
//  SeparatorLine.swift
//  Sokar
//
//  Created by Taimoor Arif on 10/05/2024.
//

import SwiftUI

struct SeparatorLine: View {
    
    var body: some View {
        Group {
            
            let color = Color(hex: "#66E4FE").opacity(0.01)
            
            LinearGradient(colors: [color, .white, color], startPoint: .leading, endPoint: .trailing)
        }
        .frame(height: 0.5)
    }
}

#Preview {
    SeparatorLine()
}
