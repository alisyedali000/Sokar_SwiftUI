//
//  PlusButton.swift
//  Sokar
//
//  Created by Taimoor Arif on 15/04/2024.
//

import SwiftUI

struct PlusButton: View {
    
    private var action : () -> Void
    
    init(action: @escaping () -> Void) {
        
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.accent)
                    .frame(width: 53, height: 53)
                
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
            }
        }
    }
}

#Preview {
    PlusButton(action: {})
}
