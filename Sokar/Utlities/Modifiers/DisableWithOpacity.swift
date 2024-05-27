//
//  DisableWithOpacity.swift
//  Paysanao
//
//  Created by Taimoor Arif on 13/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    func disableWithOpacity(_ condition: Bool) -> some View {
        
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}
