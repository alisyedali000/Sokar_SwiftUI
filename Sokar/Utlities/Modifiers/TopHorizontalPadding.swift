//
//  TopLeadingPadding.swift
//  Paysanao
//
//  Created by Taimoor Arif on 13/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    var topHorizontalPadding: some View {
        modifier(TopHorizontalPadding())
    }
}

struct TopHorizontalPadding: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .padding([.horizontal, .top])
    }
}
