//
//  AddShadow.swift
//  Paysanao
//
//  Created by Taimoor Arif on 13/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    var addShadow: some View {
        modifier(AddShadow())
    }
}

struct AddShadow: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .shadow(color: .gray.opacity(0.8), radius: 0.1)
    }
}
