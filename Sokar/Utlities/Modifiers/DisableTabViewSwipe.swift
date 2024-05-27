//
//  DisableTabViewSwipe.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

extension View {
    
    var disableTabViewSwipe: some View {
        modifier(DisableTabViewSwipe())
    }
}

struct DisableTabViewSwipe: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .contentShape(Rectangle())
            .gesture(DragGesture())
    }
}
