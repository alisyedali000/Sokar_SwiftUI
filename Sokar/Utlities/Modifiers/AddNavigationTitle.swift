//
//  AddNavigationTitle.swift
//  Sokar
//
//  Created by Taimoor Arif on 16/04/2024.
//

import SwiftUI

extension View {
    
    func addNavigationTitle(title: String) -> some View {
        modifier(AddNavigationTitle(title: title))
    }
}

struct AddNavigationTitle: ViewModifier {
    
    private var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}
