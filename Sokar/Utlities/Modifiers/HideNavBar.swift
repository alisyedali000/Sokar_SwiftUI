//
//  HideNavBar.swift
//  Paysanao
//
//  Created by Taimoor Arif on 12/02/2024.
//

import Foundation
import SwiftUI

extension View {
    
    var hideNavigationBar: some View {
        modifier(HideNavBar())
    }
}

struct HideNavBar : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
