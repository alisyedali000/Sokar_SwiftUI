//
//  FlipTransition.swift
//  Sokar
//
//  Created by Taimoor Arif on 30/04/2024.
//

import SwiftUI

struct FlipTransition: ViewModifier, Animatable {
    
    var progress: CGFloat = 0
    var animatableData: CGFloat {
        
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        
        content
            .opacity(progress < 0 ? (-progress < 0.5 ? 1 : 0) : (progress < 0.5 ? 1 : 0))
            .rotation3DEffect(
                .init(degrees: progress * 180),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
    }
}

extension AnyTransition {
    
    static let flip: AnyTransition = .modifier(
        active: FlipTransition(progress: -1), // active refers to animating phase
        identity: FlipTransition() // identity refers to stationary phase
    )
    
    static let reverseFlip: AnyTransition = .modifier(
        active: FlipTransition(progress: 1), // active refers to animating phase
        identity: FlipTransition() // identity refers to stationary phase
    )
}
