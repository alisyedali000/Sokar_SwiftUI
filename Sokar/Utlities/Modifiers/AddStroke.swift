//
//  AddStroke.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    var addStroke: some View {
        modifier(AddStroke())
    }
}

struct AddStroke: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .overlay {
                
                Circle()
                    .stroke(.accent, lineWidth: 2)
            }
    }
}
