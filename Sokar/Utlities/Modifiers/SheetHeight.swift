//
//  SheetHeight.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

extension View {
    
    func addSheetHeight(detents: Set<PresentationDetent>) -> some View {
        
        modifier(SheetHeight(detents: detents))
    }
}

struct SheetHeight: ViewModifier {
    
    private var detents: Set<PresentationDetent>
    
    init(detents: Set<PresentationDetent>) {
        self.detents = detents
    }
    
    func body(content: Content) -> some View {
        
        content
            .presentationDetents(detents)
            .presentationDragIndicator(.visible)
    }
}
