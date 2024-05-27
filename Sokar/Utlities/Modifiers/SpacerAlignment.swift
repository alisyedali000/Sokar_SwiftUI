//
//  SpacerAlignment.swift
//  Sokar
//
//  Created by Taimoor Arif on 23/04/2024.
//

import Foundation
import SwiftUI

extension View {
    
    func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}
