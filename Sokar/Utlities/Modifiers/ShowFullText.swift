//
//  ShowFullText.swift
//  Sokar
//
//  Created by Taimoor Arif on 04/04/2024.
//

import Foundation
import SwiftUI

extension View {
    
    var showFullText: some View {
        modifier(FullText())
    }
}

struct FullText: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}
