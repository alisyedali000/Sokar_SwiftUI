//
//  AddBackground.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    var addBackground: some View {
        modifier(Background())
    }
    
    func addBackgroundColor(color: Color) -> some View {
        modifier(BackgroundColor(color: color))
    }
}

struct Background: ViewModifier {
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            AppBG()
            
            content
        }
    }
}

struct BackgroundColor: ViewModifier {
    
    private var color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        
        ZStack {
            
            color
                .ignoresSafeArea()
            
            content
        }
    }
}
