//
//  AddExtraSpace.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

extension View {
    
    var addBottomSpace: some View {
        modifier(AddExtraSpace())
    }
}

struct AddExtraSpace: ViewModifier {
    
    func body(content: Content) -> some View {
        
        VStack {
         
            content
            
            Rectangle()
                .foregroundStyle(.clear)
                .frame(height: 60)
        }
    }
}
